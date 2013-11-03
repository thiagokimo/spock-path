require 'test_helper'

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
