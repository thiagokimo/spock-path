require './point_test'

@points_counter = 0

def find_limit
  point = Point.new(0,0)

  while point.spock_path?
    point = Point.new(point.x+1, point.y)
  end

  point.x
end

def calculate_variation(limit)

 x = limit
 y = 0

 #calculates only the first quadrant points
 for x in (0).upto(298)
   for y in (298).downto(0)
    @points_counter += 1 if Point.new(x,y).spock_path?
   end
 end
end

def find_spock_path
  limit = find_limit

  calculate_variation(limit)

  #Removing the point (0,0)
  @points_counter = limit - 1

  # Multiply the number of points found in the first quadrant by 4
  @points_counter = @points_counter * 4
end

puts "Number of points that Spock is able to go, starting from (0,0) is #{find_spock_path}"
