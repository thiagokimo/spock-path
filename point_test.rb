require 'minitest/autorun'

class Point

  attr_reader :x, :y

  def initialize(x,y)
    @x, @y = x, y
  end

  def spock_path?
    (algarism_sum(self.x)+algarism_sum(self.y)) <= 19
  end

  private
  def algarism_sum(number)
    number_string = number.to_s
    (0..number_string.size).inject { |sum, algarism| sum += number_string[algarism].to_i }
  end
end

describe Point do

  # "Ele só pode ir nas áreas onde a soma dos algarismos das coordenadas X e Y são menores ou iguais a 19.
  #  O ponto 77,49, por exemplo, não é acessível porque 7+7+4+9=27 é > que 19"
  it "should sum the coordinates algarisms" do
    point = Point.new(77,49)

    point.spock_path?.must_equal true
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
end
