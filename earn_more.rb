class EarnMore

  attr_accessor :size, :two_d_array, :x, :y

  def initialize(size)
    @size = size
    @two_d_array = []

  end

  def set_two_dimension_array
    two_d_array = (1..size).map do |n|
                    (1..10).map(&:to_i).shuffle.first(size)
                  end
  end

  def get_the_wealthiest_way
    x, y = 0, 0
    dead_end = size - 1
    while(x < dead_end && y < dead_end) do
      
    end
  end
end


em = EarnMore.new(4)

p em.set_two_dimension_array
p em.x
p em.y