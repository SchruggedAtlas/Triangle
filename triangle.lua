require "class"
require 'point'

Triangle = class(
  function(a, name)
    a.name = name
  end
)

function Triangle:set_starting_point()
  self.starting_point = Point()
  local start_x = (self.p1.x + self.p2.x)/self.divisor
  local start_y = (self.p1.y + self.p2.y)/self.divisor
  self.starting_point:init(start_x, start_y)
end

function Triangle:init(screen_w, screen_h)
  self.screen_width = screen_w
  self.screen_height = screen_h
  self.edge_offset = 10 -- pixels
  self.divisor = 2
  self.points = {}
  -- Create the verticies of the triangle
  self.p1 = Point()
  self.p2 = Point()
  self.p3 = Point()
  -- Initialize the anchor vertices
  self.p1:init(self.screen_width/2, self.edge_offset)
  self.p2:init(self.edge_offset, self.screen_height - self.edge_offset)
  self.p3:init(self.screen_width - self.edge_offset, self.screen_height - self.edge_offset)
  -- Insert the anchor vertices
  table.insert(self.points, self.p1)
  table.insert(self.points, self.p2)
  table.insert(self.points, self.p3)
  -- Choose a starting point
  self:set_starting_point()
end

function Triangle:controller()
  -- Choose an anchor point randomly (1, 2, or 3)
  reference_point = love.math.random(1, 3)
  -- Calculate the point halfway between the starting_point and the anchor point
  local xx = 0
  local yy = 0

  if(reference_point == 1) then
    xx = (self.p1.x + self.starting_point.x)/self.divisor
    yy = (self.p1.y + self.starting_point.y)/self.divisor
  end

  if(reference_point == 2) then
    xx = (self.p2.x + self.starting_point.x)/self.divisor
    yy = (self.p2.y + self.starting_point.y)/self.divisor
  end

  if(reference_point == 3) then
    xx = (self.p3.x + self.starting_point.x)/self.divisor
    yy = (self.p3.y + self.starting_point.y)/self.divisor
  end
  -- Add a point at the halfway point. Set starting_point to the added point
  local new_point = Point()
  new_point:init(xx, yy)
  table.insert(self.points, new_point)
  self.starting_point:update(xx, yy)
  -- Draw all points
  self:draw()
end

function Triangle:draw()
  for index, pt in ipairs(self.points) do
    if pt.y <= self.screen_height/2 then
      -- Set color to red
      love.graphics.setColor(1,0,0)
    elseif (pt.y > self.screen_height/2) and (pt.x <= self.screen_width/2) then
      -- Set color to blue
      love.graphics.setColor(0,1,0)
    else
      -- Set color to yellow
      love.graphics.setColor(1,1,0)
    end
    love.graphics.circle("fill", pt.x, pt.y, 1)
  end
end
