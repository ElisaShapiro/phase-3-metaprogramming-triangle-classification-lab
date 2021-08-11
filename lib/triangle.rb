class Triangle
  attr_reader :side_a, :side_b, :side_c
  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end
  def kind
    validate_triangle
    if side_a == side_b && side_b == side_c
      :equilateral
    elsif side_a == side_b || side_b == side_c || side_a == side_c
      :isosceles
    else
      :scalene
    end
  end
  def sides_positive
    [side_a, side_b, side_c].all?(&:positive?)
  end
  def triangle_inequality_theorem
    side_a + side_b > side_c && side_a + side_c > side_b &&side_b + side_c > side_a 
  end
  def validate_triangle
    raise TriangleError unless sides_positive && triangle_inequality_theorem
  end
  class TriangleError < StandardError
  end
end
