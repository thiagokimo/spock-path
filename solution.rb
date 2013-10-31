require './point_test'

@start = Point.new(0,0)
@walkable_points = [@start]

def start_walking_spock

  @walkable_points.each do |point|
    point.neighbors.each do |p|
      @walkable_points << p if p.spock_path?
    end
  end
end

start_walking_spock
