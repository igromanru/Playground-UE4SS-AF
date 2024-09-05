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
    -- ExecuteInGameThread(function()
        LogDebug("------------ L ---------------")
        local myPlayer = AFUtils.GetMyPlayer()
        if myPlayer then
            -- local location = myPlayer:K2_GetActorLocation()
            -- location.Z = location.Z + 100
            -- SpawnActorFromClass("/Game/Blueprints/Items/Weapons/Abiotic_Weapon_Melee_ParentBP.Abiotic_Weapon_Melee_ParentBP_C", location)
            
            -- AFUtils.LogCharacterParentBP(myPlayer)
            -- AFUtils.LogAbioticCharacter(myPlayer)
            -- LogDebug("DefaultGravityScale: ", myPlayer.DefaultGravityScale)
            -- LogCharacterMovementComponent(myPlayer.CharacterMovement, "CharacterMovement.")
            
            -- local progressionComponent = myPlayer.CharacterProgressionComponent
            -- if progressionComponent:IsValid() then
            --     LogDebug("CharacterProgressionComponent.CharacterSkills_Keys Num: " .. #progressionComponent.CharacterSkills_Keys)
            --     for i = 1, #progressionComponent.CharacterSkills_Keys, 1 do
            --         local skillKey = progressionComponent.CharacterSkills_Keys[i]
            --         LogDebug(string.format("%d: %d", i, skillKey))
            --     end

            --     LogDebug("CharacterProgressionComponent.CharacterSkills_Values Num: " .. #progressionComponent.CharacterSkills_Values)
            --     for i = 1, #progressionComponent.CharacterSkills_Values, 1 do
            --         local skillStruct = progressionComponent.CharacterSkills_Values[i]
            --         -- LogDebug(string.format("%d: %s", i, skillStruct.SkillName_12_151AF436411AC221F1B7A295B82A483E:ToString()))
            --         -- LogDebug("SkillTooltip: " .. skillStruct.SkillTooltip_19_0D5F12434F2DBC48AE7090961B6F4DF0:ToString())
            --         LogDebug("CurrentSkillXP: " .. skillStruct.CurrentSkillXP_20_8F7934CD4A4542F036AE5C9649362556)
            --         LogDebug("CurrentXPMultiplier: " .. skillStruct.CurrentXPMultiplier_15_9DA8B8A24B4F5B134743CDBE828520F0)
            --     end
            -- end
            -- if myPlayer.ItemInHand_BP:IsValid() then
            --     AFUtils.LogItemParentBP(myPlayer.ItemInHand_BP)
            -- end
            -- if myPlayer.CharacterInventory:IsValid() then
            --     -- myPlayer.CharacterInventory.MaxSlots = 42
            --     -- myPlayer.CharacterInventory:UpdateInventorySlotCount(myPlayer.CharacterInventory.MaxSlots)
            --     LogDebug("CharacterInventory.MaxSlots: "..myPlayer.CharacterInventory.MaxSlots)
            -- end
            -- LogDebug("Trait_FannyPack: " .. tostring(myPlayer.Trait_FannyPack))
            -- myPlayer.Trait_FannyPack = true
            -- if myPlayer.CharacterHotbarInventory:IsValid() then
            --     myPlayer.CharacterHotbarInventory.MaxSlots = 10
            --     myPlayer.CharacterHotbarInventory:UpdateInventorySlotCount(myPlayer.CharacterHotbarInventory.MaxSlots)
            --     LogDebug("CharacterHotbarInventory.MaxSlots: "..myPlayer.CharacterHotbarInventory.MaxSlots)
            -- end
        end

        -- local gameState = GetGameState()
        -- if gameState then
        --     LogDebug("GameState.Class: " .. gameState:GetClass():GetFullName())
        --     LogDebug("MatchState: " .. gameState.MatchState:ToString())
        -- end

        local myPlayerController = AFUtils.GetMyPlayerController()
        if myPlayerController then
            if myPlayerController.DayNightManager:IsValid() then
                -- myPlayerController.DayNightManager.IsNight = false
                AFUtils.LogDayNightManager(myPlayerController.DayNightManager, "DayNightManager.")
                -- AFUtils.SetNextWeatherEvent(AFUtils.WeatherEvents.Fog)
            end
        end
        local powerSockets = FindAllOf("PowerSocket_ParentBP_C")
        ---@cast powerSockets APowerSocket_ParentBP_C[]?
        if powerSockets then
            LogDebug("PowerSocke count: " .. #powerSockets)
            for i = 1, #powerSockets, 1 do
                ---@type APowerSocket_ParentBP_C
                local powerSocket = powerSockets[i]
                if powerSocket:IsValid() then
                    LogDebug("Socket: " .. i .. " SocketAlwaysPowered: ", powerSocket.SocketAlwaysPowered)
                    -- powerSocket.SocketAlwaysPowered = true
                end
            end
        end

        local worldSettings = GetWorldSettings()
        ---@cast worldSettings AAbioticWorldSettings?
        if worldSettings then
            AFUtils.LogWorldSettings(worldSettings)
        end

        -- local outRowHandles = {}
        -- AFUtils.GetWeatherEventHandleFunctionLibrary():GetAllWeatherEventRowHandles(outRowHandles)
        -- LogDebug("WeatherEventRowHandles Num: " .. #outRowHandles)
        -- for i = 1, #outRowHandles, 1 do
        --     local rowHandle = outRowHandles[i]:get()
        --     LogDebug(string.format("%d: RowName: %s", i, rowHandle.RowName:ToString()))
        -- end
        -- LeyakTest()
        LogDebug("------------------------------")
    -- end)
end)

RegisterKeyBind(Key.Z, function()
    ExecuteInGameThread(function()
        local hitActor = ForwardLineTraceByChannel(3)
        if hitActor then
            LogDebug("--- [ForwardLineTraceByChannel]:")
            LogDebug("HitActor: " .. hitActor:GetFullName())
            LogDebug("ClassName: " .. hitActor:GetClass():GetFullName())
            
            if hitActor:IsA(AFUtils.GetClassActor()) then
                ---@cast hitActor AActor
                LogDebug("Location: ", VectorToString(hitActor:K2_GetActorLocation()))
            end

            if hitActor:IsA(AFUtils.GetClassDeployed_Battery_ParentBP_C()) then
                AFUtils.LogDeployedBattery(hitActor)
                -- hitActor["Update Current Item Data"]()
            end
            if hitActor:IsA(AFUtils.GetClassAbioticDeployed_ParentBP_C()) then
                ---@cast hitActor AAbioticDeployed_ParentBP_C
                AFUtils.LogInventoryChangeableDataStruct(hitActor.ChangeableData, "ChangeableData.")
            end
            if hitActor:IsA(AFUtils.GetClassNarrativeNPC_ParentBP_C()) then
                ---@cast hitActor ANarrativeNPC_ParentBP_C
                AFUtils.LogNarrativeNPC(hitActor)
            end
            if hitActor:IsA(AFUtils.GetClassAbiotic_Character_ParentBP_C()) then
                ---@cast hitActor AAbiotic_Character_ParentBP_C
                AFUtils.LogCharacterParentBP(hitActor)
            end
            LogDebug("------------------------------")
        end
    end)
end)

RegisterKeyBind(Key.U, function()
    ExecuteInGameThread(function()
        LogDebug("------------ U ---------------")
        -- local aiDirector = AFUtils.GetAIDirector()
        -- if aiDirector then
        --     -- local cooldownInMin = 1.0
        --     -- aiDirector.LeyakCooldown = cooldownInMin * 60.0
        --     -- aiDirector:SetLeyakOnCooldown(1.0)
        --     LogDebug("LeyakCooldown set to: "..aiDirector.LeyakCooldown.." ("..cooldownInMin.." min)")
        -- end
        -- AFUtils.TriggerWeatherEvent(AFUtils.WeatherEvents.RadLeak)
        LogDebug("------------------------------")
    end)
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

RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:CheckPlayersLeftStartingZone", function(Context, LeftZone)
    local dayNightManager = Context:get()
    local leftZone = LeftZone:get()

    LogDebug("----- [CheckPlayersLeftStartingZone] called -----")
    LogDebug("LeftZone: ", leftZone)
    LogDebug("------------------------------")
end)

-- RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context, NewPawn)
--     local playerController = Context:get()
--     local pawn = NewPawn:get()

--     LogDebug("----- [ClientRestart] called -----")
--     LogDebug("Pawn.Class: " .. pawn:GetClass():GetFullName())
--     local gameState = GetGameState()
--         if gameState then
--             LogDebug("GameState.Class: " .. gameState:GetClass():GetFullName())
--             LogDebug("MatchState: " .. gameState.MatchState:ToString())
--         end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Script/Engine.PlayerController:ServerAcknowledgePossession", function(Context, Pawn)
--     local playerController = Context:get()
--     local pawn = Pawn:get()

--     LogDebug("----- [ServerAcknowledgePossession] called -----")
--     LogDebug("Pawn.Class: " .. pawn:GetClass():GetFullName())
--     LogDebug("------------------------------")
-- end)

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

-- RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:SpawnLeyak", function(Context, Location)
--     local aiDirector = Context:get()
--     local location = Location:get()

--     LogDebug("----- [SpawnLeyak] called -----")
--     -- local aiControllerLeyak = FindFirstOf("AI_Controller_Leyak_C")
--     -- if aiControllerLeyak and aiControllerLeyak:IsValid() then
--     --     LogDebug("AI_Controller_Leyak_C found, call Despawn")
--     --     aiControllerLeyak:Despawn()
--     -- end
--     LogDebug("------------------------------")
-- end)

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

-- local JagerName = NAME_None
-- local function GetJagerName()
--     if JagerName == NAME_None then
--         JagerName = FName("Jager", EFindName.FNAME_Find)
--     end
--     return JagerName
-- end

-- LoopAsync(500, function()
--     local humanNPCs = FindAllOf("NarrativeNPC_Human_ParentBP_C")
--     if humanNPCs then
--         for i, humanNPC in ipairs(humanNPCs) do
--             ---@cast humanNPC ANarrativeNPC_Human_ParentBP_C
--             local JagerName = GetJagerName()
--             if JagerName ~= NAME_None and humanNPC.NarrativeNPC_ConversationRow.RowName == JagerName and humanNPC.IsDead then
--                 LogDebug("Found dead Dr. Jager, destroy actor")
--                 ExecuteInGameThread(function()
--                     humanNPC:K2_DestroyActor()
--                 end)
--                 return true
--             end
--         end
--     end
--     return false
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_InventoryComponent.Abiotic_InventoryComponent_C:UpdateInventorySlotCount", function(Context, NewMaxSlots)
--     local inventoryComponent = Context:get()
--     local newMaxSlots = NewMaxSlots:get()

--     local myPlayer = AFUtils.GetMyPlayer()
--     if myPlayer and myPlayer.CharacterInventory:IsValid() and myPlayer.CharacterHotbarInventory:IsValid() then
--         if myPlayer.CharacterInventory:GetAddress() == inventoryComponent:GetAddress() then
--             LogDebug("[UpdateInventorySlotCount] called: -----")
--             LogDebug("NewMaxSlots: "..newMaxSlots)
--             LogDebug("------------------------------")
--             -- local targetMaxSlots = 42
--             -- if newMaxSlots < targetMaxSlots then
--             --     inventoryComponent.MaxSlots = targetMaxSlots
--             --     -- inventoryComponent:UpdateInventorySlotCount(targetMaxSlots)
--             -- end
--         end
--         if myPlayer.CharacterHotbarInventory:GetAddress() == inventoryComponent:GetAddress() then
--             LogDebug("[UpdateInventorySlotCount] called: -----")
--             LogDebug("NewMaxSlots: "..newMaxSlots)
--             LogDebug("------------------------------")
--         end
--     end
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_InventoryComponent.Abiotic_InventoryComponent_C:ComputeCurrentInventoryWeight", function(Context, TotalWeight)
--     local inventoryComponent = Context:get()
--     local totalWeight = TotalWeight:get()

--     local myPlayer = AFUtils.GetMyPlayer()
--     if myPlayer and myPlayer.CharacterInventory:IsValid() then
--         if myPlayer.CharacterInventory:GetAddress() == inventoryComponent:GetAddress() then
--             LogDebug("[ComputeCurrentInventoryWeight] called: -----")
--             LogDebug("TotalWeight: "..totalWeight)
--             LogDebug("------------------------------")
--         end
--     end
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:CheckForWeatherRequest", function(Context, Requested)
--     local dayNightManager = Context:get()
--     local requested = Requested:get()

--     LogDebug("----- [CheckForWeatherRequest] called -----")
--     LogDebug("Requested: " .. tostring(requested))
--     -- AFUtils.LogDayNightManager(dayNightManager)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:OnRep_CurrentWeatherEvent", function(Context)
--     local dayNightManager = Context:get()

--     LogDebug("----- [OnRep_CurrentWeatherEvent] called -----")
--     -- AFUtils.LogDayNightManager(dayNightManager)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:TriggerWeatherEvent", function(Context, EventRow)
--     local dayNightManager = Context:get()
--     local eventRow = EventRow:get()

--     LogDebug("----- [TriggerWeatherEvent] called -----")
--     LogDebug("EventRow type: " .. eventRow:type())
--     LogDebug("EventRow.RowName: " .. eventRow.RowName:ToString())
--     LogDebug("EventRow.DataTablePath: " .. eventRow.DataTablePath:ToString())
--     -- AFUtils.LogDayNightManager(dayNightManager)
--     LogDebug("------------------------------")
-- end)

LogInfo("Mod loaded successfully")
