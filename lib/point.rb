class Point

  FIRST_QUADRANT, SECOND_QUADRANT, THRID_QUADRANT, FOURTH_QUADRANT = 1,2,3,4

  attr_reader :x, :y, :neighbours, :quadrant
  attr_accessor :visited

  def initialize(x,y, visited=false)
    @x, @y = x, y
    @visited = visited
    define_quadrant
  end

  def ==(otherPoint)
    (self.x == otherPoint.x) and (self.y == otherPoint.y)
  end

  def neighbours
    @neighbours ||= build_neighbours
  end

  def spock_path?
    (algarism_sum(self.x)+algarism_sum(self.y)) <= 19
  end

  def to_s
    "(#{self.x},#{self.y})"
  end

  private
  def define_quadrant
    @quadrant = FIRST_QUADRANT if self.x >= 0 and self.y >= 0
    @quadrant = SECOND_QUADRANT if self.x < 0 and self.y >= 0
    @quadrant = THRID_QUADRANT if self.x < 0 and self.y < 0
    @quadrant = FOURTH_QUADRANT if self.x >= 0 and self.y < 0
  end

  def algarism_sum(number)
    number.to_s.split('').map(&:to_i).inject { |sum, number|  sum + number }
  end

  def build_neighbours
    neighbours = []

    # first
    neighbours << Point.new(self.x-1, self.y+1)

    #second
    neighbours << Point.new(self.x, self.y+1)

    # third
    neighbours << Point.new(self.x+1, self.y+1)

    #fourth
    neighbours << Point.new(self.x-1, self.y)

    # fifth
    neighbours << Point.new(self.x+1, self.y)

    # sixth
    neighbours << Point.new(self.x-1, self.y-1)

    # seventh
    neighbours << Point.new(self.x, self.y-1)

    # eighth
    neighbours << Point.new(self.x+1, self.y-1)

    neighbours
  end
end
