--[[
    Author: Igromanru
    Date: 19.08.2024
    Mod Name: My Playground
]]

------------------------------
-- Don't change code below --
------------------------------
local AFUtils = require("AFUtils.AFUtils")
require("AFUtils.AFUtilsDebug")

ModName = "Playground"
ModVersion = "1.0.0"
DebugMode = true

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

RegisterKeyBind(Key.L, function()
    ExecuteInGameThread(function()
        LogDebug("------------ L ---------------")
        local aiDirector = FindFirstOf("Abiotic_AIDirector_C")
        if aiDirector and aiDirector:IsValid() then
            LogDebug("-- Abiotic_AIDirector_C:")
            AFUtils.LogAIDirector(aiDirector)
            local timerHandle = { Handle = aiDirector.LeyakTimer.Handle }
            LogDebug("LeyakTimer IsValid: "..tostring(GetKismetSystemLibrary():K2_IsValidTimerHandle(timerHandle)))
            timerHandle.Handle = aiDirector.CoworkerTimer.Handle
            LogDebug("CoworkerTimer IsValid: "..tostring(GetKismetSystemLibrary():K2_IsValidTimerHandle(timerHandle)))
            if aiDirector.ActiveLeyak:IsValid() then
                LogDebug("-- ActiveLeyak:")
                AFUtils.LogNPCLeyak(aiDirector.ActiveLeyak)

                -- aiDirector.ActiveLeyak:DropEssence()
            else
                local spawnDistanceInM = 20
                local playerController = GetMyPlayerController()
                if playerController and playerController.PlayerCameraManager:IsValid() then
                    local cameraManager = playerController.PlayerCameraManager
                    local lookDirection = cameraManager:GetActorForwardVector()
                    local lookDirOffset = GetKismetMathLibrary():Multiply_VectorFloat(lookDirection, MToUnits(spawnDistanceInM))
                    local spawnLocation = GetKismetMathLibrary():Add_VectorVector(cameraManager:GetCameraLocation(), lookDirOffset)
                    aiDirector:SpawnLeyak(VectorToUserdata(spawnLocation));
                end
            end
        else
            LogDebug("No Abiotic_AIDirector_C found")
        end
        local aiControllerLeyak = FindFirstOf("AI_Controller_Leyak_C")
        if aiControllerLeyak and aiControllerLeyak:IsValid() then
            LogDebug("-- AI_Controller_Leyak_C:")
            AFUtils.LogAIControllerLeyak(aiControllerLeyak)
            -- aiControllerLeyak.WantsToDespawn = true
        else
            LogDebug("No AI_Controller_Leyak_C found")
        end
        -- local myPlayer = AFUtils.GetMyPlayer()
        -- if myPlayer then
        --     local currentItem = myPlayer.ItemInHand_BP
        --     if currentItem:IsValid() then
        --         local itemData = currentItem.ItemData
        --         local changeableData = currentItem.ChangeableData
        --         LogDebug("ItemInHand:")
        --         LogDebug("ItemName: " .. itemData.ItemName_51_B88648C048EE5BC2885E4E95F3E13F0A:ToString())

        --         AFUtils.LogInventoryChangeableDataStruct(changeableData, "ChangeableData.")
        --     end
        -- end
        LogDebug("------------------------------")
    end)
end)

RegisterKeyBind(Key.Z, function()
    ExecuteInGameThread(function()
        local hitActor = ForwardLineTraceByChannel(3)
        if hitActor then
            LogDebug("[ForwardLineTraceByChannel]:")
            LogDebug("HitActor: " .. hitActor:GetFullName())
            LogDebug("ClassName: " .. hitActor:GetClass():GetFullName())

            if hitActor:IsA(AFUtils.GetClassDeployed_Battery_ParentBP_C()) then
                AFUtils.LogDeployedBattery(hitActor)
                -- hitActor["Update Current Item Data"]()
            end
            if hitActor:IsA(AFUtils.GetClassAbioticDeployed_ParentBP_C()) then
                AFUtils.LogInventoryChangeableDataStruct(hitActor.ChangeableData, "ChangeableData.")
            end
            LogDebug("------------------------------")
        end
    end)
end)

RegisterKeyBind(Key.U, function()
    ExecuteInGameThread(function()
        LogDebug("------------ U ---------------")
        local aiControllerLeyak = FindFirstOf("AI_Controller_Leyak_C")
        if aiControllerLeyak and aiControllerLeyak:IsValid() then
            aiControllerLeyak:Despawn()
        else
            LogDebug("No AI_Controller_Leyak_C found")
        end
        LogDebug("------------------------------")
    end)
end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:GetCurrentHeldItem", function(Context, Success, ItemSlotInfo, ItemData, Blueprint)
--     local playerCharacter = Context:get()
--     local success = Success:get()
--     local itemSlotInfo = ItemSlotInfo:get()
--     local itemData = ItemData:get()
--     local blueprint = Blueprint:get() -- AAbiotic_Item_ParentBP_C

--     if success then
--         LogDebug("[GetCurrentHeldItem] called:")
--         LogDebug("Success: " .. tostring(success))

--         LogDebug("CurrentHotbarSlotSelected.Index: " ..  playerCharacter.CurrentHotbarSlotSelected.Index_5_6BDC7B3944A5DE0B319F9FA20720872F)
--         LogDebug("LastSelectedHotbarSlot: " ..  playerCharacter.LastSelectedHotbarSlot)
--         -- AFUtils.LogInventoryItemSlotStruct(itemSlotInfo, "ItemSlotInfo.")
--         -- LogDebug("---")
--         -- AFUtils.LogInventoryItemStruct(itemData, "ItemData.")
--         -- LogDebug("---")
--         -- AFUtils.LogInventoryItemStruct(playerCharacter.CurrentHeldItemData, "CurrentHeldItemData.")
--         LogDebug("---")
--         if blueprint:IsValid() then
--             LogDebug("Blueprint: " .. blueprint:GetClass():GetFullName())
--             if blueprint:IsA(AFUtils.GetClassAbiotic_Item_ParentBP_C()) then
--                 AFUtils.LogItemParentBP(blueprint, "Blueprint.")
--                 LogDebug("---")
--                 -- AFUtils.LogInventoryItemStruct(blueprint.ItemData, "Blueprint.ItemData.")
--                 -- AFUtils.LogInventoryChangeableDataStruct(blueprint.ChangeableData, "Blueprint.ChangeableData.")
--             end
--             -- LogDebug("BlueprintCreatedComponents Num: " .. #blueprint.BlueprintCreatedComponents)
--             -- for i = 1, #blueprint.BlueprintCreatedComponents, 1 do
--             --     local component = blueprint.BlueprintCreatedComponents[i]
--             --     if component:IsValid() then
--             --         LogDebug(i .. ": " .. component:GetClass():GetFullName())
--             --     end
--             -- end
--         end
--         LogDebug("------------------------------")
--     end
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_InventoryComponent.Abiotic_InventoryComponent_C:GetItemInSlot", function(Context, Index, Success, SlotData, ItemData)
--     local this = Context:get()
--     local index = Index:get()
--     local success = Success:get()
--     local slotData = SlotData:get()
--     local itemData = ItemData:get()

--     LogDebug("[InventoryComponent_C:GetItemInSlot] called:")
--     LogDebug("Index: " .. index)
--     LogDebug("Success: " .. tostring(success))
--     AFUtils.LogInventoryItemSlotStruct(itemSlotInfo, "SlotData.")
--     LogDebug("---")
--     AFUtils.LogInventoryItemStruct(itemData, "ItemData.")
--     LogDebug("------------------------------")
-- end)

RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:SpawnLeyak", function(Context, Location)
    local aIDirector = Context:get()
    local location = Location:get()

    LogDebug("[SpawnLeyak] called:")
    AFUtils.LogAIDirector(aIDirector)
    local leakTimer = {
        Handle = aIDirector.LeyakTimer.Handle
    }
    
    LogDebug("------------------------------")
end)

RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:LeyakFailsafeRemove", function(Context)
    local aIDirector = Context:get()

    LogDebug("[Abiotic_AIDirector_C:LeyakFailsafeRemove] called:")
    LogDebug("------------------------------")
end)

RegisterHook("/Game/Blueprints/Characters/NPCs/AI_Controller_Leyak.AI_Controller_Leyak_C:Despawn", function(Context)
    local aiControllerLeyak = Context:get()

    LogDebug("[AI_Controller_Leyak_C:Despawn] called:")
    LogDebug("------------------------------")
end)

RegisterHook("/Game/Blueprints/Characters/NPCs/NPC_Leyak.NPC_Leyak_C:OnDespawn", function(Context)
    local aiControllerLeyak = Context:get()

    LogDebug("[NPC_Leyak_C:OnDespawn] called:")
    LogDebug("------------------------------")
end)

-- RegisterHook("/Game/Blueprints/Characters/NPCs/NPC_Leyak.NPC_Leyak_C:ReceiveTick", function(Context, DeltaSeconds)
--     local aiControllerLeyak = Context:get()

--     LogDebug("[NPC_Leyak_C:ReceiveTick] called:")
--     LogDebug("------------------------------")
-- end)

LogInfo("Mod loaded successfully")
