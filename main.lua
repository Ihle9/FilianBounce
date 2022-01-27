--FilianBounce by Ihle9
function love.load()
        Filian_Png = love.graphics.newImage("Filian.png")
        Filian = {
        XPos = Filian_Png:getWidth()/2,
        YPos = Filian_Png:getHeight()/2,
        XSpeed = -250,
        YSpeed = -250,
        Rotation = 0
                 }
        Fun_Mode = false
        Rotation_Speed = 1
        --green screen
        love.graphics.setBackgroundColor(0/255,1,1/255)
end

function love.draw()
        --filian
        if Fun_Mode == true then
                love.graphics.draw(Filian_Png, Filian.XPos + math.random(-70, 70), Filian.YPos + math.random(-70, 70), Filian.Rotation, 1, 1, Filian_Png:getWidth()/2, Filian_Png:getHeight()/2)
        else
                love.graphics.draw(Filian_Png, Filian.XPos, Filian.YPos, 0, 1, 1, Filian_Png:getWidth()/2, Filian_Png:getHeight()/2)
        end
end

function love.update(dt)
        Filian.XPos = Filian.XPos + Filian.XSpeed * dt
        Filian.YPos = Filian.YPos + Filian.YSpeed * dt
--collition
        --azmith
        if Filian.XPos < Filian_Png:getWidth()/2 then
                Filian.XSpeed = math.abs(Filian.XSpeed)
                Rotation_Speed = math.random(-3,3)
        end
        if Filian.XPos > love.graphics.getWidth() - Filian_Png:getWidth()/2 then
                Filian.XSpeed = math.abs(Filian.XSpeed) * -1
                Rotation_Speed = math.random(-3,3)
        end
        --vertical
        if Filian.YPos < Filian_Png:getHeight()/2 then
                Filian.YSpeed = math.abs(Filian.YSpeed)
                Rotation_Speed = math.random(-3,3)
        end
        if Filian.YPos > love.graphics.getHeight() - Filian_Png:getHeight()/2 then
                Filian.YSpeed = math.abs(Filian.YSpeed) * -1
                Rotation_Speed = math.random(-3,3)
        end
        --shake
        if Fun_Mode == true then
                Filian.Rotation = Filian.Rotation + Rotation_Speed*dt
        end
end

function love.keypressed(key)
        if key == "escape" then
                love.event.quit()
        end
--reset
        if key == "return" then
                love.load()
        end
--change Speed
--X axis (side to side)
        --increase
        if key == "right" then
                Filian.XSpeed = Filian.XSpeed * 1.1
        end
        --decreace
        if key == "left" then
                Filian.XSpeed = Filian.XSpeed * 0.9
        end
--Y axis (vertical)
--increase
        if key == "up" then
                Filian.YSpeed = Filian.YSpeed * 1.1
        end
        --decreace
        if key == "down" then
                Filian.YSpeed = Filian.YSpeed * 0.9
        end

--fun mode (AKA - Cursed)
        if key == "rshift" then
                Fun_Mode = not Fun_Mode
                print(Fun_Mode)
        end
end

love.window.showMessageBox("Keybinds for FilianBounce 1.0","Reset: Enter \nFun Mode: Right Shift \n\nThank you for using FilianBounce by Ihle9")
