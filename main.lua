

-- constants
-- define the tile size
CELLSIZE = 16
WINDOWWIDTH, WINDOWHEIGHT = love.graphics.getDimensions()
PADDING = 64
EGGTIME = 10

ANIMSPEED = 5
-- singleton for game start, so that assets are only loaded once
startGame = true

function loadGame()
    placeholdersImage = love.graphics.newImage("assets/tama-placeholders.png")

    eggSprite = love.graphics.newQuad(0, 0, 32, 32, placeholdersImage)
    babyBoySprite = love.graphics.newQuad(32, 0, 32, 32, placeholdersImage)
    babyGirlSprite = love.graphics.newQuad(64, 0, 32, 32, placeholdersImage)

    foodButtonSprite = love.graphics.newQuad(0, 32, 16, 16, placeholdersImage)
    toiletButtonSprite = love.graphics.newQuad(16, 32, 16, 16, placeholdersImage)
    heartButtonSprite = love.graphics.newQuad(32, 32, 16, 16, placeholdersImage)

    emptyHeartSprite = love.graphics.newQuad(0, 48, 16, 16, placeholdersImage)
    fullHeartSprite = love.graphics.newQuad(16, 48, 16, 16, placeholdersImage)

    emptyBowlSprite = love.graphics.newQuad(0, 64, 16, 16, placeholdersImage)
    fullBowlSprite = love.graphics.newQuad(32, 64, 16, 16, placeholdersImage)

    love.graphics.setBackgroundColor(0.75, 1, 1)

    startTime = love.timer.getTime()
end

function love.load()
    -- load assets if this is first level
    if startGame then
        loadGame()
        startGame = false
    end

    
end

function love.keypressed(key)

end

function love.update(dt)
    
end

function love.draw()
    -- draw buttons
    love.graphics.draw(placeholdersImage, foodButtonSprite, PADDING, 32, 0, 3, 3)
    love.graphics.draw(placeholdersImage, toiletButtonSprite, (WINDOWWIDTH/2), 32, 0, 3, 3)
    love.graphics.draw(placeholdersImage, heartButtonSprite, WINDOWWIDTH - PADDING, 32, 0, 3, 3)

    -- draw pet
    local currentTime = love.timer.getTime()
    if currentTime - startTime >= EGGTIME then
        love.graphics.draw(placeholdersImage, babyBoySprite, WINDOWWIDTH/2, WINDOWHEIGHT/2, 0, 3, 3)
    else
        love.graphics.draw(placeholdersImage, eggSprite, WINDOWWIDTH/2, WINDOWHEIGHT/2, 0, 3, 3)
    end
end