require "class"
require 'point'

Triangle = class(
  function(a, name)
    a.name = name
  end
)

function Triangle:init(screen_w, screen_h)
  print("Initializing Triangle")
  self.screen_width = screen_w
  self.screen_height = screen_h
  self.edge_offset = 20 -- pixels
  print(self.screen_width)
  print(self.screen_height)
  self.points = {}
  -- Create the verticies of the triangle
  p1 = Point()
  p2 = Point()
  p3 = Point()
  p1:init(self.screen_width/2, self.edge_offset)
  p2:init(self.edge_offset, self.screen_height - self.edge_offset)
  p3:init(self.screen_width - self.edge_offset, self.screen_height - self.edge_offset)
end

function Triangle:controller()
  self:draw()
end

function Triangle:draw()
  love.graphics.circle("fill", p1.x, p1.y, 2)
  love.graphics.circle("fill", p2.x, p2.y, 2)
  love.graphics.circle("fill", p3.x, p3.y, 2)
end
