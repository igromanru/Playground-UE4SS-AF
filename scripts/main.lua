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
            LogDebug(string.format("HitActor: %s", hitActor:GetFullName()))
            LogDebug(string.format("FullClassName: %s", hitActor:GetClass():GetFullName()))
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

-- RegisterHook("/Game/Blueprints/DeployedObjects/Misc/Deployed_Battery_ParentBP.Deployed_Battery_ParentBP_C:BatteryTick", function(Context)
--     local this = Context:get()

--     if this.ChangeableData and this.ChangeableData.LiquidLevel_46_D6414A6E49082BC020AADC89CC29E35A < this.MaxBattery then
--         LogDebug("[BatteryTick] called:")
--         this.ChangeableData.LiquidLevel_46_D6414A6E49082BC020AADC89CC29E35A = this.MaxBattery
--         LogDebug("Set LiquidLevel: " .. this.ChangeableData.LiquidLevel_46_D6414A6E49082BC020AADC89CC29E35A)
--         LogDebug("------------------------------")
--     end
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Server Heavy Armor Debuff Check", function(Context, WeightClassValue)
--     local this = Context:get()
--     local weightClassValue = WeightClassValue:get()

--     LogDebug("[Server Heavy Armor Debuff Check] called:")
--     LogDebug("WeightClassValue: " .. weightClassValue)
--     LogDebug("------------------------------")
--     if weightClassValue > 0 then
--         this["Server Heavy Armor Debuff Check"](0)
--     end
-- end)

-- RegisterHook("/Game/Blueprints/Items/RechargeableComponent.RechargeableComponent_C:Server_ModifyBattery", function(Context, Amount, NotOwnedByPlayer)
--     local this = Context:get()
--     local amount = Amount:get()
--     local notOwnedByPlayer = NotOwnedByPlayer:get()

--     if not this.RechargeableActive then
--         return
--     end

--     LogDebug("[Server_ModifyBattery] called:")
--     LogDebug("Amount: " .. amount)
--     LogDebug("NotOwnedByPlayer: " .. tostring(notOwnedByPlayer))

--     LogDebug("RechargeableActive: " .. tostring(this.RechargeableActive))
--     LogDebug("LastBatteryLevel: " .. this.LastBatteryLevel)
--     LogDebug("DrainPerTick: " .. this.DrainPerTick)
--     LogDebug("ChargeMultiplier: " .. this.ChargeMultiplier)
--     LogDebug("LastItemChargePercentage: " .. this.LastItemChargePercentage)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Items/RechargeableComponent.RechargeableComponent_C:Server_DrainBattery", function(Context)
--     local this = Context:get()

--     LogDebug("[Server_DrainBattery] called:")
--     LogDebug("RechargeableActive: " .. tostring(this.RechargeableActive))
--     LogDebug("LastBatteryLevel: " .. this.LastBatteryLevel)
--     LogDebug("DrainPerTick: " .. this.DrainPerTick)
--     LogDebug("ChargeMultiplier: " .. this.ChargeMultiplier)
--     LogDebug("LastItemChargePercentage: " .. this.LastItemChargePercentage)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/DeployedObjects/Misc/Deployed_Battery_ParentBP.Deployed_Battery_ParentBP_C:GetPluggedInDeviceCount", function(Context, Count)
--     local this = Context:get()
--     local count = Count:get()
--     local rechargeableComponent = this.RechargeableComponent

--     LogDebug("[ADeployed_Battery_ParentBP_C:GetPluggedInDeviceCount] called:")
--     LogDebug("Count: " .. count)
--     LogDebug("HasBatteryPower: " .. tostring(this.HasBatteryPower))
--     LogDebug("PowerTimerActive: " .. tostring(this.PowerTimerActive))
--     LogDebug("BatteryPercentage: " .. this.BatteryPercentage)
--     LogDebug("DevicesPullingPower: " .. this.DevicesPullingPower)
--     LogDebug("MaxBattery: " .. this.MaxBattery)
--     LogDebug("FreezeBatteryDrain: " .. tostring(this.FreezeBatteryDrain))

--     if rechargeableComponent and rechargeableComponent:IsValid() then
--         LogDebug("RechargeableActive: " .. tostring(rechargeableComponent.RechargeableActive))
--         LogDebug("LastBatteryLevel: " .. rechargeableComponent.LastBatteryLevel)
--         LogDebug("DrainPerTick: " .. rechargeableComponent.DrainPerTick)
--         LogDebug("ChargeMultiplier: " .. rechargeableComponent.ChargeMultiplier)
--         LogDebug("LastItemChargePercentage: " .. rechargeableComponent.LastItemChargePercentage)
--     end
--     LogDebug("------------------------------")
-- end)

LogInfo("Mod loaded successfully")
