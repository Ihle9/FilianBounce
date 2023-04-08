--FilianBounce by Ihle9
Scale = 1
function love.load()
        Fil_Versions = {
                love.graphics.newImage("Filian.png"),
                love.graphics.newImage("Filian2.png"),
                love.graphics.newImage("Snailian.png"),
                love.graphics.newImage("FillyCoconut.png")
                        }


        Current_Fil = 1

        Filian = {
        XPos = Fil_Versions[Current_Fil]:getWidth()*Scale/2,
        YPos = Fil_Versions[Current_Fil]:getHeight()*Scale/2,
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
                love.graphics.draw(Fil_Versions[Current_Fil], Filian.XPos + math.random(-70*Scale, 70*Scale), Filian.YPos + math.random(-70*Scale, 70*Scale), Filian.Rotation, Scale, Scale, Fil_Versions[Current_Fil]:getWidth()/2, Fil_Versions[Current_Fil]:getHeight()/2)
        else
                love.graphics.draw(Fil_Versions[Current_Fil], Filian.XPos, Filian.YPos, 0, Scale, Scale, Fil_Versions[Current_Fil]:getWidth()/2, Fil_Versions[Current_Fil]:getHeight()/2)
        end
end

function love.update(dt)
        Filian.XPos = Filian.XPos + Filian.XSpeed * dt
        Filian.YPos = Filian.YPos + Filian.YSpeed * dt
--collition
        --azmith
        if Filian.XPos < Fil_Versions[Current_Fil]:getWidth()*Scale/2 then
                Filian.XSpeed = math.abs(Filian.XSpeed)
                Rotation_Speed = math.random(-3,3)
        end
        if Filian.XPos > love.graphics.getWidth() - Fil_Versions[Current_Fil]:getWidth()*Scale/2 then
                Filian.XSpeed = math.abs(Filian.XSpeed) * -1
                Rotation_Speed = math.random(-3,3)
        end
        --vertical
        if Filian.YPos < Fil_Versions[Current_Fil]:getHeight()*Scale/2 then
                Filian.YSpeed = math.abs(Filian.YSpeed)
                Rotation_Speed = math.random(-3,3)
        end
        if Filian.YPos > love.graphics.getHeight() - Fil_Versions[Current_Fil]:getHeight()*Scale/2 then
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
--scale
        --increase
        if key == "," then
                Scale = Scale + 0.05
        end
        --decreace
        if key == "." then
                Scale = Scale - 0.05
        end
--next PNG
        if key == "`" then

                if Current_Fil == #Fil_Versions then
                        Current_Fil = 1
                else
                        Current_Fil = Current_Fil + 1
                end

        end

--show controls
        if key == "f1" then
                love.window.showMessageBox("Keybinds for FilianBounce 1.3","Reset: Enter \nFun Mode: Right Shift \nNext Picture: ` (backtick, same key as the tilde) \nSee Controls: F1 (also pauses the window) \n\nUp Arrow: Increase vertical speed \nDown Arrow: Decrease vertical speed \nLeft Arrow: Decrease horizontal speed \nRight Arrow: Increase horizontal speed \n\nComma: Increase Scale \nPeriod: Decrease Scale \nEsc: Close application \n\nThank you for using FilianBounce by Ihle9")
        end
end

love.window.showMessageBox("Keybinds for FilianBounce 1.3","Reset: Enter \nFun Mode: Right Shift \nNext Picture: ` (backtick, same key as the tilde) \nSee Controls: F1 (also pauses the window) \n\nUp Arrow: Increase vertical speed \nDown Arrow: Decrease vertical speed \nLeft Arrow: Decrease horizontal speed \nRight Arrow: Increase horizontal speed \n\nComma: Increase Scale \nPeriod: Decrease Scale \nEsc: Close application \n\nThank you for using FilianBounce by Ihle9")
