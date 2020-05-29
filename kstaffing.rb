#this class will be generating the manager pages
class DocGen

  # the constructor
  def initialize(aConn)
    #the connection
    @conn=aConn        
  end
  
  # the sql retrive code
  def generatedDoc()   
    asciidocCode = self.generateColumnDef
    #asciidocCode = asciidocCode + self.generateStoredProcDef
    return asciidocCode
  end
  
  #this functin will generate the class def
  # def genrateTableDef()
    # res=@conn.exec("select tablename from pg_tables where schemaname='public'")
    # retType = ""
    # for i in res
     # retType = retType +"=="+ i[0].to_s + "\n"
    # end
    # puts retType
    # return retType
  # end
  #get the Comments of the table for the tables used
  def genrateTabledesc(tabName)
    res=@conn.exec("select obj_description(oid) from pg_class where relname='#{tabName}'")
    retType=""
    for i in res
      retType = retType + "#{i[0].to_s}"
    end
    return retType
  end  
  
  #get the defination of the columns for the tables used
  def generateColumnDef()
    res=@conn.exec("select tablename from pg_tables where schemaname='public'")
    classObj = ""
    for i in res
      classObj = classObj + "\n\n\n== "+ i[0].to_s + "\n"
      classObj = classObj + genrateTabledesc(i[0].to_s)
      classObj = classObj + "\n"
      classObj = classObj + ".Properties\n"
      classObj = classObj + "[frame=\"none\",options=\"header\"]\n"
      classObj = classObj + "|======================================================================================\n"
      classObj = classObj + "|                         |        Data Type       |           Description             \n"
      classObj = classObj + self.singleTableColDef(i.to_s)
      classObj = classObj + "|======================================================================================\n"
      classObj = classObj + "=== Links\n"
      classObj = classObj + self.generateForeignKeyDef(i.to_s)
      classObj = classObj + "=== Methods\n"
      classObj = classObj + self.generateStoredProcDef(i.to_s)
    end
    puts classObj
    return classObj
  end

  #required with generatecolumndef to get the defination of columns of a single table
  def singleTableColDef(tabName)
    res=@conn.exec("SELECT column_name,data_type,column_default,is_nullable FROM information_schema.columns WHERE table_name ='#{tabName}'")
    retType=""
    for i in res
      colVal = "+"+i[0].to_s+"+" 
      dataType = "+"+i[1].to_s+"+" 
      retType = retType + "|"+colVal.center(25)+"|"+dataType.center(24)+"|"+self.singleTableColDesc(tabName)
      retType = retType + "\n"
    end
    return retType
  end
  def singleTableColDesc(tabName)
    res=@conn.exec("SELECT pg_class.relname as classname, attname, description FROM pg_class, pg_attribute, pg_description WHERE pg_class.relname = '#{tabName}' AND pg_class.oid = pg_attribute.attrelid AND pg_attribute.attnum > 0 AND (objoid = pg_class.oid) AND (attnum = objsubid) ORDER BY attname;")
    retType=""
    for i in res
      desc="+"+i[2].to_s.strip+"+"
      retType = retType + desc.center(35)
    end
    return retType.to_s
  end   
  
  def generateForeignKeyDef(tabName)
    res=@conn.exec("SELECT conrelid::regclass AS  relname, confrelid::regclass AS  mainTable, pg_get_constraintdef(oid) AS condef FROM pg_constraint WHERE contype = 'f'
")
    retType=""
    for i in res
      relName = i[0].to_s
      mainTable = i[1].to_s
      if relName == "#{tabName}" or mainTable== "#{tabName}" then
      #.+films+ (++actors__films++)
        retType = retType + ".+#{i[1].to_s}+(++#{i[0].to_s}__#{i[1].to_s}++)\n"
        retType = retType + "#{i[2].to_s}\n"
      end
    end
    #puts retType
    return retType
  end
  
  def generateStoredProcDef(tabName)
    res=@conn.exec("select proname, proargnames, type_udt_name from pg_proc c inner join information_schema.routines on routine_name = proname where proname like 'lp_%'")
    retType=""
    for i in res
      
      funcName = i[0].to_s
      funcName = funcName[3,funcName.length-1].capitalize
      paramVal = i[1].to_s  
      paramVal = paramVal[1,paramVal.length-2]
      @returnType = i[2].to_s
      if @returnType == "#{tabName}" then
        retType = retType +".++"+funcName+"("+paramVal+")"
        retType = retType +" RETURNS SETOF "+@returnType+"++\n"
        retType = retType + self.generateStoredProcDesc
      end
    end
    #puts retType
    return retType
  end
  def generateStoredProcDesc
    res=@conn.exec("select obj_description(oid, 'pg_proc') from pg_proc where proname like 'lp_%'")
    retType=""
    for i in res
      funcDesc = i[0].to_s
      retType = retType + funcDesc +"\n"
    end
    #puts retType
    return retType
  end
end 