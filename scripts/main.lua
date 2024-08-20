--[[
    Author: Igromanru
    Date: 19.08.2024
    Mod Name: My Test
]]

-------------------------------------
-- Hotkey to toggle the mod on/off --
-- Possible keys: https://github.com/UE4SS-RE/RE-UE4SS/blob/main/docs/lua-api/table-definitions/key.md
local ToggleModKey = Key.L
-- See ModifierKey: https://github.com/UE4SS-RE/RE-UE4SS/blob/main/docs/lua-api/table-definitions/modifierkey.md
-- ModifierKeys can be combined. e.g.: {ModifierKey.CONTROL, ModifierKey.ALT} = CTRL + ALT + L
local ToggleModKeyModifiers = {}
-------------------------------------

------------------------------
-- Don't change code below --
------------------------------
local AFUtils = require("AFUtils.AFUtils")

ModName = "Playground"
ModVersion = "1.0.0"
DebugMode = true

local function ModDisplayTextChatMessage(Message)
    local prefix = GetModInfoPrefix()
    -- LogDebug("ModDisplayTextChatMessage Prefix: " .. prefix .. ", Message: " .. Message)
    AFUtils.DisplayTextChatMessage(Message, prefix)
end

LogInfo("Starting mod initialization")

local IsModEnabled = false
local function SetModState(Enable)
    ExecuteInGameThread(function()
        Enable = Enable or false
        IsModEnabled = Enable
        local state = "Disabled"
        if IsModEnabled then
            state = "Enabled"
        end
        LogInfo("Mod state changed to: " .. state)
        ModDisplayTextChatMessage(state)
    end)
end

RegisterKeyBind(ToggleModKey, ToggleModKeyModifiers, function()
    -- SetModState(not IsModEnabled)
    ExecuteInGameThread(function()
        print("ToggleModKey pressed")
        local myPlayer = AFUtils.GetMyPlayer()
        if myPlayer then
            local currentItem = myPlayer.ItemInHand_BP
            if currentItem then
                local itemData = currentItem.ItemData
                local changeableData = currentItem.ChangeableData
                LogDebug("ItemInHand:")
                LogDebug("ItemName: " .. itemData.ItemName_51_B88648C048EE5BC2885E4E95F3E13F0A:ToString())

                AFUtils.LogInventoryChangeableDataStruct(changeableData, "ChangeableData.")
            end
        end
    end)
end)

RegisterKeyBind(Key.Z, function()
    ExecuteInGameThread(function()
        local hitActor = ForwardLineTraceByChannel(3)
        if hitActor then
            LogDebug("HitActor: " .. hitActor:GetFullName())
            LogDebug("ClassName: " .. hitActor:GetClass():GetFullName())
            if hitActor:IsA(AFUtils.GetClassDeployed_Battery_ParentBP_C()) then
                hitActor["Update Current Item Data"]()

                AFUtils.LogDeployedBattery(hitActor)
                -- hitActor.FreezeBatteryDrain = true
                -- hitActor.ChangeableData.LiquidLevel_46_D6414A6E49082BC020AADC89CC29E35A = hitActor.MaxBattery
            end
            if hitActor:IsA(AFUtils.GetClassAbioticDeployed_ParentBP_C()) then
                AFUtils.LogInventoryChangeableDataStruct(hitActor.ChangeableData, "ChangeableData.")
            end
        end
    end)
end)

RegisterHook("/Game/Blueprints/Items/Weapons/Guns/Weapon_FishingRod.Weapon_FishingRod_C:TickMinigame", function(Context, DeltaTime)
    local this = Context:get()
    local deltaTime = DeltaTime:get()

    if this.ActiveFishSpeed > 0 and this.CurrentOwner and this.CurrentOwner:IsValid() then
        LogDebug("[TickMinigame] called:")
        LogDebug("Param DeltaTime: " .. deltaTime)
        LogDebug("ActiveRodTension: " .. this.ActiveRodTension)
        LogDebug("NextDirectionChangeTime: " .. this.NextDirectionChangeTime)
        LogDebug("NextCooldownTime: " .. this.NextCooldownTime)
        LogDebug("FishCaptureProgress: " .. this.FishCaptureProgress)
        LogDebug("FishCaptureDistance: " .. this.FishCaptureDistance)
        LogDebug("FishCaptureStage: " .. this.FishCaptureStage)
        LogDebug("ActiveFishSpeed: " .. this.ActiveFishSpeed)
        LogDebug("TimeToStartMinigame: " .. this.TimeToStartMinigame)
        LogDebug("HasActiveFish: " .. tostring(this.HasActiveFish))
        LogDebug("ReelAnimTime: " .. this.ReelAnimTime)
        LogDebug("Reeling: " .. tostring(this.Reeling))
        LogDebug("HotspotActive: " .. tostring(this.HotspotActive))
        LogDebug("LastTimeFishingEnded: " .. this.LastTimeFishingEnded)
        LogDebug("CatchingJunk: " .. tostring(this.CatchingJunk))
        LogDebug("JunkReward.RowName: " .. this.JunkReward.RowName:ToString())
        LogDebug("FishReward.RowName: " .. this.FishReward.RowName:ToString())
        LogDebug("FishReward.DataTablePath: " .. this.FishReward.DataTablePath:ToString())
        LogDebug("RequiredCaptures: " .. this.RequiredCaptures)
        LogDebug("TackleboxActive: " .. tostring(this.TackleboxActive))
        LogDebug("LuckyHat: " .. tostring(this.LuckyHat))
        LogDebug("OwnerLastKnownLevel: " .. this.OwnerLastKnownLevel)
        LogDebug("------------------------------")

        local myPlayer = AFUtils.GetMyPlayer()
        if myPlayer and myPlayer:GetAddress() == this.CurrentOwner:GetAddress() then
            this.TimeToStartMinigame = 10.0
            if this.ActiveRodTension > 0 then
                this:FishingSuccess()
            end
        end
    end
end)


LogInfo("Mod loaded successfully")
