

local Loader = {}
Loader.__index = Loader

-- Teleport script for jailbreak



local Player = game.Players.LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character or Player.CharacterAdded:Wait()
local Point = Character:WaitForChild("HumanoidRootPart")
local TweenService = game:GetService("TweenService")

function Logger:Notification(Title,Desc) 
local CoreGui = game:GetService("CoreGui") local CorePackages = game:GetService("CorePackages") local UIBlox = getrenv().require(CorePackages.UIBlox) UIBlox.init() local StylePalette = getrenv().require(CorePackages.AppTempCommon.LuaApp.Style.StylePalette) local stylePalette = StylePalette.new() stylePalette:updateTheme("dark") stylePalette:updateFont("gotham") local Roact = getrenv().require(CorePackages.Roact) local Images = getrenv().require(CorePackages.Packages._Index.UIBlox.UIBlox.App.ImageSet.Images) local Gui =Roact.createElement("ScreenGui",{IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Global},{Gui = Roact.createElement(UIBlox.Core.Style.Provider,{style = stylePalette},{Toast = Roact.createElement(UIBlox.App.Dialog.Toast,{toastContent = {toastTitle = Title,toastSubtitle = Desc,iconImage = Images["icons/menu/trade"]}})})}) Roact.mount(Gui, CoreGui, "Notification")
task.wait(3)
game:GetService("CoreGui"):WaitForChild("Notification"):Destroy()
end

function Bypass()
    coroutine.wrap(Notify)("Teleporting!","Please wait.")
    for i = 1,15 do
        if Backpack:FindFirstChild("Punch") then
        Character:WaitForChild("Humanoid"):EquipTool(Backpack.Punch)
        elseif Character:FindFirstChild("Punch") then
        Character:WaitForChild("Humanoid"):UnequipTools()
        else
        coroutine.wrap(Notify)("Failed!","You must have the punch tool to finish teleporting.")
        break
        end
        task.wait(0.07)
    end
end


function Logger:AirStuck()
Point.Anchored = false
end

function Logger:TP(Player)
    if not game.Players:FindFirstChild(Player) then
    coroutine.wrap(Notify)("Failed!","Player is either invalid or has left the game.")
    elseif game.Players:FindFirstChild(Player) then
    Character.Humanoid.Jump = true
    local Target = game.Players:WaitForChild(Player).Character:WaitForChild("HumanoidRootPart").CFrame
    coroutine.wrap(Bypass)()
    TweenService:Create(Point, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {CFrame = Target}):Play()
    task.wait(1.4)
    Point.Anchored = true
    task.wait(1.2)
    Point.Anchored = false
    Point.CFrame = Point.CFrame - Vector3.new(0,-10,0)
    end
end

function Logger:TPP(X,Y,Z)
    Character.Humanoid.Jump = true
    local Target = CFrame.new(X,Y,Z)
    coroutine.wrap(Bypass)()
    TweenService:Create(Point, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {CFrame = Target}):Play()
    task.wait(1.4)
    Point.Anchored = true
    task.wait(1.2)
    Point.Anchored = false
    Point.CFrame = Point.CFrame - Vector3.new(0,-10,0)
end

return Loader
