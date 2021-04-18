require 'triangle'

function love.load()
    -- love.window.setMode(0,0, {vsync=true})
    total_time = 0
    screen_w = love.graphics.getWidth()
    screen_h = love.graphics.getHeight()
    triangle = Triangle()
    triangle:init(screen_w, screen_h)
end

function love.update(dt)
    total_time = total_time + dt
end

function love.draw()
    -- love.graphics.circle("fill", 10, 10, 2)
    triangle:controller()
end