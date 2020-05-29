class QuadraticFormula

  def setup
    a, b, c = ["a", "b", "c"].map do |char|
                puts "Enter value for #{char}: "
                gets.to_i
              end
    (b^2 - 4*a*c).positive? or raise "Invalid inputs"

    @a, @b, @c = [a, b, c] 
  end

  def display_answer
    answers = [
      (-@b + square_root_equation) / equation_underneath,
      (-@b - square_root_equation) / equation_underneath
    ]
    puts "Answer is #{answers.join(' or ')}"
  end

  private

    def square_root_equation
      Math.sqrt(inside_sqrt)
    end

    def equation_underneath
      2 * @a
    end

    def inside_sqrt
      (@b * @b) - ( 4 * @a * @c )
    end
end

quadratic_formula = QuadraticFormula.new
quadratic_formula.setup
quadratic_formula.display_answer

