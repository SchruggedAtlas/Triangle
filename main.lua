require 'triangle'

function love.load()
    love.window.setMode(0,0, {vsync=true})
    total_time = 0
    screen_w = love.graphics.getWidth()
    screen_h = love.graphics.getHeight()
    num_generators = 100
    trainagles = {}

    for i=1, num_generators do
        local generator = Triangle()
        generator:init(screen_w, screen_h)
        table.insert(trainagles, generator)
    end
end

function love.update(dt)
    total_time = total_time + dt
end

function love.draw()
    for index, t in ipairs(trainagles) do
        t:controller()
    end
end