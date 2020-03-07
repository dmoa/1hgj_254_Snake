la = love.audio
ld = love.data
le = love.event
lfile = love.filesystem
lf = love.font
lg = love.graphics
li = love.image
lj = love.joystick
lk = love.keyboard
lm = love.math
lmouse = love.mouse
lp = love.physics
lsound = love.sound
lsys = love.system
lth = love.thread
lt = love.timer
ltouch = love.touch
lv = love.video
lw = love.window

lg.setDefaultFilter("nearest", "nearest", 1)
lg.setLineStyle('rough')

splash = require "libs/splash"

function love.draw() splash:update() end
splash:startSplashScreen("start_screen.png", "", 1500, 500, 2, {}, function()


push = require "libs/push"
gameWidth, gameHeight = 512, 512
windowL = 512
lw.setMode(windowL, windowL, {borderless = false})
push:setupScreen(gameWidth, gameHeight, windowL, windowL, {fullscreen = false, resizable = true, borderless = false})

screen = require "libs/shack"
screen:setDimensions(push:getDimensions())

function love.draw()
    screen:apply()
    push:start()

    for i = 1, 512, 16 do
        love.graphics.line(i, 0, i, gameHeight)
    end
    for i = 1, 512, 16 do
        love.graphics.line(0, i, gameWidth, i)
    end
    love.graphics.line(gameWidth, 0, gameWidth, gameHeight)
    love.graphics.line(0, gameHeight, gameWidth, gameHeight)

    push:finish()
end

function love.update(dt)
    screen:update(dt)
end

function love.keypressed(key)
    if key == "escape" then le.quit() end
    if key == "return" and lk.isDown("lalt") then push:switchFullscreen() end
end

function love.resize(w, h)
  push:resize(w, h)
  loadingScreen.angle = 0
  lg.clear()
end

end)