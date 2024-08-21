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
    ExecuteInGameThread(function()
        local myPlayer = AFUtils.GetMyPlayer()
        if myPlayer then
            local currentItem = myPlayer.ItemInHand_BP
            if currentItem:IsValid() then
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

RegisterKeyBind(Key.U, function()
    ExecuteInGameThread(function()
        
    end)
end)

RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:GetCurrentHeldItem", function(Context, Success, ItemSlotInfo, ItemData, Blueprint)
    local this = Context:get()
    local success = Success:get()
    local itemSlotInfo = ItemSlotInfo:get()
    local itemData = ItemData:get()
    local blueprint = Blueprint:get()
    LogDebug("Blueprint type: " .. Blueprint:type())
    LogDebug("blueprint type: " .. blueprint:type())

    LogDebug("[GetCurrentHeldItem] called:")
    LogDebug("Success: " .. tostring(success))
    AFUtils.LogInventoryItemSlotStruct(itemSlotInfo, "ItemSlotInfo.")
    AFUtils.LogInventoryItemStruct(itemData, "ItemData.")
    if blueprint:IsValid() then
        LogDebug("Blueprint: " .. blueprint:GetClass():GetFullName())
        if blueprint:IsA(AFUtils.GetClassAbiotic_Item_ParentBP_C()) then
            AFUtils.LogInventoryItemStruct(blueprint.ItemData, "Blueprint.ItemData.")
            AFUtils.LogInventoryChangeableDataStruct(blueprint.ChangeableData, "Blueprint.ChangeableData.")
        end
        -- AFUtils.SetItemLiquidLevel(blueprint)
    end
    LogDebug("------------------------------")
end)

LogInfo("Mod loaded successfully")
