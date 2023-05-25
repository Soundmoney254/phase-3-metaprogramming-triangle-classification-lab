class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle

    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    unless @side1 > 0 && @side2 > 0 && @side3 > 0
      raise TriangleError, "Invalid triangle: sides must be larger than 0"
    end

    unless @side1 + @side2 > @side3 && @side2 + @side3 > @side1 && @side1 + @side3 > @side2
      raise TriangleError, "Invalid triangle: does not satisfy the triangle inequality"
    end
  end

  class TriangleError < StandardError
  end
end
