require 'minitest/autorun'

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

describe Point do

  # "Ele só pode ir nas áreas onde a soma dos algarismos das coordenadas X e Y são menores ou iguais a 19.
  #  O ponto 77,49, por exemplo, não é acessível porque 7+7+4+9=27 é > que 19"
  it "should sum the coordinates algarisms" do
    point = Point.new(77,49)

    point.spock_path?.must_equal false
  end

  describe "#visited" do
    it "should be false if is not defined in the constructor" do
      point = Point.new(11,11)
      point.visited.must_equal false
    end

    it "must be true if defined in the constructor" do
      point = Point.new(11,11,true)
      point.visited.must_equal true
    end
  end

  # 2  |  1
  # ---|----
  # 3  |  4
  describe "#quadrant" do
    it "the point (1,1) is located in the first quadrant" do
      point = Point.new(1,1)
      point.quadrant.must_equal 1
    end

    it "the point (-1,1) is located in the second quadrant" do
      point = Point.new(-1,1)
      point.quadrant.must_equal 2
    end

    it "the point (-1,-1) is located in the third quadrant" do
      point = Point.new(-1,-1)
      point.quadrant.must_equal 3
    end

    it "the point (1,-1) is located in the fourth quadrant" do
      point = Point.new(1,-1)
      point.quadrant.must_equal 4
    end
  end

  it "the algarims sum of the point (1,1) must be 2" do
    point = Point.new(1,1)

    point.spock_path?.must_equal true
  end

  it "must store the coordinates of X and Y properly" do
    random_x = rand(11).to_i
    random_y = rand(11).to_i

    point = Point.new(random_x, random_y)

    point.x.must_equal random_x
    point.y.must_equal random_y
  end

  it "must output the object as it was a cartesian point" do
    point = Point.new(0,0)

    point.to_s.must_equal "(0,0)"
  end

  # neighbours
  # | 1 | 2 | 3 |
  # | 4 | x | 5 |
  # | 6 | 7 | 8 |
  describe "neighbours" do
    it "must have 8 neighbours" do
      point = Point.new(0,0)
      point.neighbours.size.must_equal 8
    end

    it "the first neighbor of the point (1,1) must be the point (0,2)" do
      point = Point.new(1,1)
      point.neighbours.first.must_equal Point.new(0,2)
    end

    it "the eighth neighbor of the point (1,1) must be the point (2,0)" do
      point = Point.new(1,1)
      point.neighbours.last.must_equal Point.new(2,0)
    end
  end
end
