




function love.load()
    -- Remember: camelCasing!
    listOfERectangles = {}
end

function creaEteRect(u)
    recte = {}
    recte.x = 1
    recte.y = 100
    recte.width = 10
    recte.height = 5
    recte.speed = 200
    table.insert(listOfERectangles, rect)

end
function love.keypressed(key)
    -- Remember, 2 equal signs (==) for comparing!
    if key == "e" then
        createERect()
    end
end

function love.update(dt)
    for i,v in ipairs(listOfERectangles) do
        v.y = v.y - v.speed * dt
    end
end

function love.draw(dt)

    for i,v in ipairs(listOfERectangles) do
        ---love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
        love.graphics.rectangle("line", v.x, v.y, v.width, v.height)

    end
end



