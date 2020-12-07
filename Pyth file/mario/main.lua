
Class = require 'class'
push = require 'push'

require 'Animation'
require 'Map'
require 'Player'
require 'Bullet'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

math.randomseed(os.time())

love.graphics.setDefaultFilter('nearest', 'nearest')

map = Map()
function love.load()
    listOfRectangles = {}
    listOfERectangles = {}
    love.graphics.setFont(love.graphics.newFont('fonts/font.ttf', 8))

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true
    })

    love.window.setTitle('2D Shooter')

    love.keyboard.keysPressed = {}
    love.keyboard.keysReleased = {}
end

function love.resize(w, h)
    push:resize(w, h)
end


function creaEteRect()
    recte = {}
    recte.x = 500
    recte.y = 205
    recte.width = 4
    recte.height = 1
    recte.speed = 200
    table.insert(listOfERectangles, recte)

end

function createRect()
    rect = {}
    rect.x = 220
    rect.y = 205
    rect.width = 4
    rect.height = 1
    rect.speed = 200
    table.insert(listOfRectangles, rect)

end




function love.keyboard.wasPressed(key)
    if (love.keyboard.keysPressed[key]) then
        return true
    else
        return false
    end
end

function love.keyboard.wasReleased(key)
    if (love.keyboard.keysReleased[key]) then
        return true
    else
        return false
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end

-- called whenever a key is released
function love.keyreleased(key)
    love.keyboard.keysReleased[key] = true
end

function love.update(dt)
    map:update(dt)
    for i,v in ipairs(listOfRectangles) do
        v.x = v.x + v.speed * dt
    end
    for i,v in ipairs(listOfERectangles) do
        v.x = v.x - v.speed * dt
    end
    
    love.keyboard.keysPressed = {}
    love.keyboard.keysReleased = {}
end


function love.draw()
    push:apply('start')

    love.graphics.clear(108/255, 140/255, 255/255, 255/255)
    for i,v in ipairs(listOfRectangles) do
        love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
    end
    for i,v in ipairs(listOfERectangles) do
        ---love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
        love.graphics.rectangle("line", v.x, v.y, v.width, v.height)

    end
    love.graphics.translate(math.floor(-map.camX + 0.5), math.floor(-map.camY + 0.5))
    map:render()
    
    push:apply('end')
end
