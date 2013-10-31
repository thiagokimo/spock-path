require 'minitest/autorun'

class Point

  attr_reader :x, :y, :neighbors, :visited

  def initialize(x,y, visited=false)
    @x, @y = x, y
    @visited = visited
  end

  def ==(otherPoint)
    (self.x == otherPoint.x) and (self.y == otherPoint.y)
  end

  def neighbors
    @neighbors ||= build_neighbors
  end

  def spock_path?
    (algarism_sum(self.x)+algarism_sum(self.y)) <= 19
  end

  def to_s
    "(#{self.x},#{self.y})"
  end

  private
  def algarism_sum(number)
    number_string = number.to_s
    (0..number_string.size).inject { |sum, algarism| sum += number_string[algarism].to_i }
  end

  def build_neighbors
    neighbors = []

    # first
    neighbors << Point.new(self.x-1, self.y+1)

    #second
    neighbors << Point.new(self.x, self.y+1)

    # third
    neighbors << Point.new(self.x+1, self.y+1)

    #fourth
    neighbors << Point.new(self.x-1, self.y)

    # fifth
    neighbors << Point.new(self.x+1, self.y)

    # sixth
    neighbors << Point.new(self.x-1, self.y-1)

    # seventh
    neighbors << Point.new(self.x, self.y-1)

    # eighth
    neighbors << Point.new(self.x+1, self.y-1)

    neighbors
  end
end

describe Point do

  # "Ele só pode ir nas áreas onde a soma dos algarismos das coordenadas X e Y são menores ou iguais a 19.
  #  O ponto 77,49, por exemplo, não é acessível porque 7+7+4+9=27 é > que 19"
  it "should sum the coordinates algarisms" do
    point = Point.new(77,49)

    point.spock_path?.must_equal true
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

  # Neighbors
  # | 1 | 2 | 3 |
  # | 4 | x | 5 |
  # | 6 | 7 | 8 |
  describe "neighbors" do
    it "must have 8 neighbors" do
      point = Point.new(0,0)
      point.neighbors.size.must_equal 8
    end

    it "the first neighbor of the point (1,1) must be the point (0,2)" do
      point = Point.new(1,1)
      point.neighbors.first.must_equal Point.new(0,2)
    end

    it "the eighth neighbor of the point (1,1) must be the point (2,0)" do
      point = Point.new(1,1)
      point.neighbors.last.must_equal Point.new(2,0)
    end
  end
end
