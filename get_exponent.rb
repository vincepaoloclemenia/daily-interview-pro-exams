class PowerFunction

  VALID_CHOICE_FOR_WAY_IN_GETTING_POWER = [:A, :B, :a, :b]
  def setup
    puts "Enter number"
    integer = gets.chomp.to_i
    integer > 0 or raise "Integer must be not zero"
    puts "Enter exponent"
    exponent = gets.chomp.to_i
    exponent >= 1 or raise "Exponent must be higher or equal to 1"

    @integer, @exponent = integer, exponent
  end

  def choose_a_way_to_get_power
    puts "Please choose an option to display the answer:\n" +
          "A. Basic Loop\n" +
          "B. Recursive Way"
    
    @choice_made = gets.chomp.to_sym
    validate_choice_made
  end

  # Basic loop is faster and stacks are way lesser than recursion
  def basic_loop
    answer = 1
    iterator = 1

    until iterator == @exponent do
      answer *= @integer
      iterator += 1 
    end 

    answer
  end 
    
  # Recursion is slower and takes more memory
  # but is useful when doing algorithm such as trees
  def recursive_way_of_getting_power(int, multiplier)
    return int if (int == 1 || multiplier == 1)
    multiplier -= 1
    if multiplier != 0
      return int * recursive_way_of_getting_power(int, multiplier)
    end
  end

  def default_answer
    "Answer is: #{basic_loop}"
  end

  def display_answer
    puts case @choice_made
          when :A
            default_answer
          when :B
            "Answer is: #{recursive_way_of_getting_power(@integer, @exponent)}"
          else
            default_answer
          end
  end

  private

    def validate_choice_made
      VALID_CHOICE_FOR_WAY_IN_GETTING_POWER.include?(@choice_made) or choose_a_way_to_get_power
    end
    
end


power = PowerFunction.new

power.setup
power.choose_a_way_to_get_power
power.display_answer

