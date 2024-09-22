task.wait(30)
while game.PlaceId ~= 15502339080 do 
    game:GetService("TeleportService"):Teleport(15502339080, game.Players.LocalPlayer)
    task.wait(10)
end

-- CLAIM RANDOM BOOTH
pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Booths_ClaimAnyBooth"):InvokeServer()
end)

-- RECONNECT
spawn(loadstring(game:HttpGet("https://gist.githubusercontent.com/AnigamiYT/d7ef2f539343b0d16e416d5f924ddfaa/raw/gistfile1.txt")))

-- LOW CPU
spawn(loadstring(game:HttpGet("https://gist.githubusercontent.com/AnigamiYT/43254dd3deabfd6b0743aadb2f5933a6/raw/gistfile1.txt")))

-- ANTI-AFK
local vu = game:GetService("VirtualUser")
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

local items = {
    {
        [1] = "Huge Fossil Dragon",
        [2] = nil,
        [3] = nil,
        [4] = nil,
        [5] = 35200000,
    },
}

local function addItem()
    for ii, vv in items do
        pcall(function()
            local save = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get()["Inventory"]
            for Type, List in save do
                for i, v in pairs(List) do
                    if v.id == vv[1] then
                        local price = vv[5]
                        local amount = 1
                        local args = {
                            [1] = i,
                            [2] = price,
                            [3] = amount
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Booths_CreateListing"):InvokeServer(unpack(args))
                        task.wait(5)
                    end
                end
            end
        end)
    end
end

spawn(function()
    while true do
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Claim All"):InvokeServer()
        end)
        task.wait(600)
    end
end)

while true do
    addItem()
    task.wait(5)
end
