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

local function LeyakTest()
    local aiDirector = AFUtils.GetAIDirector()
    if aiDirector then
        LogDebug("-- Abiotic_AIDirector_C:")

        -- aiDirector.LeyakCooldown = 10 * 60.0

        AFUtils.LogAIDirector(aiDirector)
        if aiDirector.ActiveLeyak:IsValid() and not IsEmptyVector(aiDirector.ActiveLeyak:K2_GetActorLocation()) then
            LogDebug("-- ActiveLeyak:")
            AFUtils.LogNPCLeyak(aiDirector.ActiveLeyak)
            
            -- aiDirector.ActiveLeyak:DropEssence()
        else
            -- local spawnDistanceInM = 20
            -- local playerController = GetMyPlayerController()
            -- if playerController and playerController.PlayerCameraManager:IsValid() then
            --     local cameraManager = playerController.PlayerCameraManager
            --     local lookDirection = cameraManager:GetActorForwardVector()
            --     local lookDirOffset = GetKismetMathLibrary():Multiply_VectorFloat(lookDirection, MToUnits(spawnDistanceInM))
            --     local spawnLocation = GetKismetMathLibrary():Add_VectorVector(cameraManager:GetCameraLocation(), lookDirOffset)
            --     aiDirector:SpawnLeyak(VectorToUserdata(spawnLocation));
            -- end
        end
    else
        LogDebug("No Abiotic_AIDirector_C found")
    end
    local aiControllerLeyak = AFUtils.GetAIControllerLeyak()
    if aiControllerLeyak and aiControllerLeyak:IsValid() then
        LogDebug("-- AI_Controller_Leyak_C:")
        AFUtils.LogAIControllerLeyak(aiControllerLeyak)
        -- aiControllerLeyak.WantsToDespawn = true
    else
        LogDebug("No AI_Controller_Leyak_C found")
    end
end

function LogRecoilStuff(myPlayer)
    LogDebug("AimRecoilAdditive: "..myPlayer.AimRecoilAdditive)
    LogDebug("ControllerRecoilTimeline_NewTrack: "..myPlayer.ControllerRecoilTimeline_NewTrack_0_AFC3F42148DFC42265088DA509116D45)
    AFUtils.LogTimelineComponent(myPlayer.ControllerRecoilTimeline, "ControllerRecoilTimeline.")
    LogDebug("RecoilTimeline_NewTrack: "..myPlayer.RecoilTimeline_NewTrack_0_7619EC7841CCE2A53A63A7841FB4C01D)
    LogDebug("RecoilTimeline__Direction (enum 0-1): "..myPlayer.RecoilTimeline__Direction_7619EC7841CCE2A53A63A7841FB4C01D)
    AFUtils.LogTimelineComponent(myPlayer.RecoilTimeline, "RecoilTimeline.")
    LogDebug("SwayTimelineLoop_NewTrack: "..VectorToString(myPlayer.SwayTimelineLoop_NewTrack_1_1E19F0E74CE5FFB6096EBC86C262A1F2))
    AFUtils.LogTimelineComponent(myPlayer.SwayTimelineLoop, "SwayTimelineLoop.")
    LogDebug("BaseGunSway_Multiplier: "..myPlayer.BaseGunSway_Multiplier)
    LogDebug("CurrentGunSway_Speed: "..myPlayer.CurrentGunSway_Speed)
    LogDebug("CrosshairCenterNoSway: "..tostring(myPlayer.CrosshairCenterNoSway))
    LogDebug("ScopeSwayTime: "..myPlayer.ScopeSwayTime)
    LogDebug("ScopeSwaySpeed: "..myPlayer.ScopeSwaySpeed)
    LogDebug("BulletSpread_Base: "..myPlayer.BulletSpread_Base)
end

RegisterKeyBind(Key.L, function()
    LogDebug("------------ L ---------------")
    local myPlayer = AFUtils.GetMyPlayer()
    if myPlayer then
        if myPlayer.ItemInHand_BP:IsValid() then
            AFUtils.LogInventoryItemStruct(myPlayer.ItemInHand_BP.ItemData)
        end
    end
    LogDebug("------------------------------")
end)

RegisterKeyBind(Key.Z, function()
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

RegisterKeyBind(Key.U, function()
    LogDebug("------------ U ---------------")
    local aiDirector = AFUtils.GetAIDirector()
    if aiDirector then
        local cooldownInMin = 1.0
        aiDirector.LeyakCooldown = cooldownInMin * 60.0
        aiDirector:SetLeyakOnCooldown(1.0)
        LogDebug("LeyakCooldown set to: "..aiDirector.LeyakCooldown.." ("..cooldownInMin.." min)")
    end
    LogDebug("------------------------------")
end)

RegisterKeyBind(Key.PAUSE, function()
    ExecuteInGameThread(function()
        LogDebug("------- NoClip (Pause) -------")
        local myPlayer = AFUtils.GetMyPlayer()
        if myPlayer then
            myPlayer.Noclip_On = not myPlayer.Noclip_On
            myPlayer:OnRep_Noclip_On()
            LogDebug("Noclip_On: " .. tostring(myPlayer.Noclip_On))
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
    local aiDirector = Context:get()
    local location = Location:get()

    LogDebug("----- [SpawnLeyak] called -----")
    -- local aiControllerLeyak = FindFirstOf("AI_Controller_Leyak_C")
    -- if aiControllerLeyak and aiControllerLeyak:IsValid() then
    --     LogDebug("AI_Controller_Leyak_C found, call Despawn")
    --     aiControllerLeyak:Despawn()
    -- end
    LogDebug("------------------------------")
end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:LeyakFailsafeRemove", function(Context)
--     local aIDirector = Context:get()

--     LogDebug("[Abiotic_AIDirector_C:LeyakFailsafeRemove] called:")
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/NPCs/AI_Controller_Leyak.AI_Controller_Leyak_C:Despawn", function(Context)
--     local aiControllerLeyak = Context:get()

--     LogDebug("[AI_Controller_Leyak_C:Despawn] called:")
--     -- local aiDirector = FindFirstOf("Abiotic_AIDirector_C")
--     -- if aiDirector and aiDirector:IsValid() then
--     --     LogDebug("LeyakCooldown: " .. aiDirector.LeyakCooldown)
--     --     if aiDirector.ActiveLeyak:IsValid() then
--     --         AFUtils.LogNPCLeyak(aiDirector.ActiveLeyak, "ActiveLeyak.")
--     --     end
--     -- end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:SetLeyakOnCooldown", function(Context, CooldownReductionMultiplier)
--     local aiDirector = Context:get()
--     local cooldownReductionMultiplier = CooldownReductionMultiplier:get()

--     LogDebug("[Abiotic_AIDirector_C:SetLeyakOnCooldown] called:")
--     LogDebug("CooldownReductionMultiplier: " .. cooldownReductionMultiplier)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/NPCs/NPC_Leyak.NPC_Leyak_C:UpdateLeyakVisibility", function(Context)
--     local leyak = Context:get()

--     LogDebug("[UpdateLeyakVisibility] called:")
--     -- leyak.SeenDespawnTime = 0.1
--     -- leyak.TimeAllowedToBeStuck = 0.1
--     -- leyak.AbsolutelyStuck = true
--     -- AFUtils.LogNPCLeyak(leyak)
--     LogDebug("------------------------------")
-- end)

NotifyOnNewObject("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C", function(AIDirector)
    LogDebug("Abiotic_AIDirector_C object was created")
    local cooldownInMin = 30.0
    AIDirector.LeyakCooldown = cooldownInMin * 60.0
    AIDirector:SetLeyakOnCooldown(1.0)
    LogDebug("LeyakCooldown set to: "..AIDirector.LeyakCooldown.." ("..cooldownInMin.." min)")
    return false
end)

LogInfo("Mod loaded successfully")
