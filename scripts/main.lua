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

local UEHelpers = require("UEHelpers")

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
    ExecuteInGameThread(function()
        LogDebug("------------ L ---------------")
        -- local gameInstance = GetGameInstance()
        -- if gameInstance and gameInstance.CustomizationUnlocksSaveFile:IsValid() and gameInstance.CustomizationUnlocksSaveFile.CustomizationUnlocks then
        --     LogDebug("CustomizationUnlocks: " .. #(gameInstance.CustomizationUnlocksSaveFile.CustomizationUnlocks))
        --     for i = 1, #(gameInstance.CustomizationUnlocksSaveFile.CustomizationUnlocks), 1 do
        --         local customization = gameInstance.CustomizationUnlocksSaveFile.CustomizationUnlocks[i]
        --         LogDebug(i .. ": " .. customization:ToString())
        --     end
        -- end
        local myPlayerController = AFUtils.GetMyPlayerController()
        if myPlayerController then
            LogDebug("myPlayerController: " .. myPlayerController:GetFullName())
            LogDebug("ActiveLevelName: " .. myPlayerController.ActiveLevelName:ToString())
        end
        local myPlayer = AFUtils.GetMyPlayer()
        if myPlayer then
            local location = myPlayer:K2_GetActorLocation()
            LogDebug("myPlayer location: " .. VectorToString(location))
            
            -- myPlayer.DefaultMaxInventoryWeight = 60.0
            -- myPlayer.MaxInventoryWeight = 900.0
            -- myPlayer:OnRep_MaxInventoryWeight()
            -- AFUtils.LogPlayerCharacter(myPlayer)
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

        local inventoryCraftingArea = AFUtils.GetMyInventoryCraftingArea()
        if inventoryCraftingArea then
            LogDebug("inventoryCraftingArea: " .. inventoryCraftingArea:GetFullName())
            if inventoryCraftingArea.LastSelectedRecipe:IsValid() then
                AFUtils.LogCraftingEntryItem(inventoryCraftingArea.LastSelectedRecipe, "LastSelectedRecipe.")
            end
        end

        -- local gameState = GetGameState()
        -- if gameState then
        --     LogDebug("GameState.Class: " .. gameState:GetClass():GetFullName())
        --     LogDebug("MatchState: " .. gameState.MatchState:ToString())
        -- end

        -- local myPlayerController = AFUtils.GetMyPlayerController()
        -- if myPlayerController then
        --     LogDebug("ActiveLevelName: " .. myPlayerController.ActiveLevelName:ToString())
        --     -- if myPlayerController.DayNightManager:IsValid() then
        --     --     -- myPlayerController.DayNightManager.IsNight = false
        --     --     AFUtils.LogDayNightManager(myPlayerController.DayNightManager, "DayNightManager.")
        --     --     -- AFUtils.SetNextWeatherEvent(AFUtils.WeatherEvents.Fog)
        --     -- end
        -- end
        -- local powerSockets = FindAllOf("PowerSocket_ParentBP_C")
        -- ---@cast powerSockets APowerSocket_ParentBP_C[]?
        -- if powerSockets then
        --     LogDebug("PowerSocke count: " .. #powerSockets)
        --     for i = 1, #powerSockets, 1 do
        --         ---@type APowerSocket_ParentBP_C
        --         local powerSocket = powerSockets[i]
        --         if powerSocket:IsValid() then
        --             LogDebug("Socket: " .. i .. " SocketAlwaysPowered: ", powerSocket.SocketAlwaysPowered)
        --             -- powerSocket.SocketAlwaysPowered = true
        --         end
        --     end
        -- end

        -- local worldSettings = GetWorldSettings()
        -- ---@cast worldSettings AAbioticWorldSettings?
        -- if worldSettings then
        --     AFUtils.LogWorldSettings(worldSettings)
        -- end

        -- local outRowHandles = {}
        -- AFUtils.GetWeatherEventHandleFunctionLibrary():GetAllWeatherEventRowHandles(outRowHandles)
        -- LogDebug("WeatherEventRowHandles Num: " .. #outRowHandles)
        -- for i = 1, #outRowHandles, 1 do
        --     local rowHandle = outRowHandles[i]:get()
        --     LogDebug(string.format("%d: RowName: %s", i, rowHandle.RowName:ToString()))
        -- end
        -- LeyakTest()
        LogDebug("------------------------------")
    end)
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

            -- if hitActor:IsA(AFUtils.GetClassDeployed_Battery_ParentBP_C()) then
            --     AFUtils.LogDeployedBattery(hitActor)
            --     -- hitActor["Update Current Item Data"]()
            -- end
            -- if hitActor:IsA(AFUtils.GetClassAbioticDeployed_ParentBP_C()) then
            --     ---@cast hitActor AAbioticDeployed_ParentBP_C
            --     AFUtils.LogInventoryChangeableDataStruct(hitActor.ChangeableData, "ChangeableData.")
            -- end
            -- if hitActor:IsA(AFUtils.GetClassNarrativeNPC_ParentBP_C()) then
            --     ---@cast hitActor ANarrativeNPC_ParentBP_C
            --     AFUtils.LogNarrativeNPC(hitActor)
            -- end
            -- if hitActor:IsA(AFUtils.GetClassAbiotic_Character_ParentBP_C()) then
            --     ---@cast hitActor AAbiotic_Character_ParentBP_C
            --     AFUtils.LogCharacterParentBP(hitActor)
            -- end
            -- if hitActor:IsA(AFUtils.GetClassCharacterCorpse_ParentBP()) then
            --     ---@cast hitActor ACharacterCorpse_ParentBP_C
            -- end
            LogDebug("------------------------------")
        end
    end)
end)

RegisterKeyBind(Key.U, function()
    ExecuteInGameThread(function()
        LogDebug("------------ U ---------------")

        local playerController = UEHelpers.GetPlayerController()
        if playerController:IsValid() then
            LogDebug("playerController: " .. playerController:GetFullName())
        else
            LogDebug("playerController invalid")
        end
        local player = UEHelpers.GetPlayer()
        if player:IsValid() then
            LogDebug("player: " .. player:GetFullName())
        else
            LogDebug("player invalid")
        end
        local gameEngine = UEHelpers.GetEngine()
        if gameEngine:IsValid() then
            LogDebug("gameEngine: " .. gameEngine:GetFullName())
        end
        local gameViewportClient = UEHelpers.GetGameViewportClient()
        if gameViewportClient:IsValid() then
            LogDebug("gameViewportClient: " .. gameViewportClient:GetFullName())
        end
        local world = UEHelpers.GetWorld()
        if world:IsValid() then
            LogDebug("world: " .. world:GetFullName())
        end
        LogDebug("WorldDeltaSeconds: " .. UEHelpers.GetGameplayStatics():GetWorldDeltaSeconds(UEHelpers.GetWorldContextObject()))
        local persistentLevel = UEHelpers.GetPersistentLevel()
        if persistentLevel:IsValid() then
            LogDebug("persistentLevel: " .. persistentLevel:GetFullName())
        else
            LogDebug("persistentLevel invalid")
        end
        local worldSettings = UEHelpers.GetWorldSettings()
        if worldSettings:IsValid() then
            LogDebug("worldSettings: " .. worldSettings:GetFullName())
        else
            LogDebug("worldSettings invalid")
        end
        local gameModeBase = UEHelpers.GetGameModeBase()
        if gameModeBase:IsValid() then
            LogDebug("gameModeBase: " .. gameModeBase:GetFullName())
        else
            LogDebug("gameModeBase invalid")
        end
        local gameStateBase = UEHelpers.GetGameStateBase()
        if gameStateBase:IsValid() then
            LogDebug("gameStateBase: " .. gameStateBase:GetFullName())
        else
            LogDebug("gameStateBase invalid")
        end
        
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

RegisterHook("/Game/Blueprints/Meta/Abiotic_GameInstance.Abiotic_GameInstance_C:IsCustomizationRowUnlocked", function(Context, RowName, Unlocked)
    local gameInstance = Context:get()
    local rowName = RowName:get()
    local unlocked = Unlocked:get()

    LogDebug("----- [IsCustomizationRowUnlocked] called -----")
    LogDebug("RowName: " .. rowName:ToString())
    LogDebug("Unlocked:", unlocked)
    -- gameInstance:UnlockCustomization(rowName)
    LogDebug("------------------------------")
end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Server_OnLevelLoadUpdated", function(Context, Level)
--     local playerCharacter = Context:get()

--     LogDebug("----- [Server_OnLevelLoadUpdated] called -----")
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Owning_OnLevelLoadUpdated", function(Context, Level)
--     local playerCharacter = Context:get()

--     LogDebug("----- [Owning_OnLevelLoadUpdated] called -----")
--     LogDebug("------------------------------")
-- end)

-- ExecuteInGameThread(function()
--     LoadAsset("/Game/Blueprints/DeployedObjects/Furniture/Deployed_Toilet_Portal.Deployed_Toilet_Portal_C")
--     RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_Toilet_Portal.Deployed_Toilet_Portal_C:DistantShoreCheck", function(Context, Character, DistantShore)
--         local deployedToiletPortal = Context:get()
--         local character = Character:get()
--         local distantShore = DistantShore:get()

--         LogDebug("----- [DistantShoreCheck] called -----")
--         LogDebug("DistantShore: ", distantShore)
--         if not distantShore then
--             deployedToiletPortal:SendToDistantShore(character)
--         end
--         LogDebug("------------------------------")
--     end)
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:CheckPlayersLeftStartingZone", function(Context, LeftZone)
--     local dayNightManager = Context:get()
--     local leftZone = LeftZone:get()

--     LogDebug("----- [CheckPlayersLeftStartingZone] called -----")
--     LogDebug("LeftZone: ", leftZone)
--     LogDebug("------------------------------")
-- end)

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
--     local inventoryComponent = Context:get() ---@type UAbiotic_InventoryComponent_C
--     local totalWeight = TotalWeight:get()

--     -- local myPlayer = AFUtils.GetMyPlayer()
--     -- if myPlayer and myPlayer.CharacterInventory:IsValid() then
--     --     if myPlayer.CharacterInventory:GetAddress() == inventoryComponent:GetAddress() then
--             LogDebug("[ComputeCurrentInventoryWeight] called: -----")
--             LogDebug("TotalWeight: ", totalWeight)
--             LogDebug("inventoryComponent.CurrentTotalInventoryWeight:", inventoryComponent.CurrentTotalInventoryWeight)
--             LogDebug("------------------------------")
--     --     end
--     -- end
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_InventoryComponent.Abiotic_InventoryComponent_C:OnRep_CurrentTotalInventoryWeight", function(Context)
--     local inventoryComponent = Context:get() ---@type UAbiotic_InventoryComponent_C

--     LogDebug("[OnRep_CurrentTotalInventoryWeight] called: -----")
--     LogDebug("inventoryComponent.CurrentTotalInventoryWeight:", inventoryComponent.CurrentTotalInventoryWeight)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Server Refresh New Inventory Weight", function(Context)
--     local playerCharacter = Context:get()

--     LogDebug("----- [Server Refresh New Inventory Weight] called -----")
--     AFUtils.LogPlayerCharacter(playerCharacter)
--     LogDebug("------------------------------")
-- end)


-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Refresh Current Max Carry Weight", function(Context)
--     local playerCharacter = Context:get() ---@type AAbiotic_PlayerCharacter_C

--     LogDebug("[Refresh Current Max Carry Weight] called: -----")
--     AFUtils.LogPlayerCharacter(playerCharacter)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Calculate Total Inventory Carry Weight", function(Context)
--     local playerCharacter = Context:get() ---@type AAbiotic_PlayerCharacter_C

--     LogDebug("[Calculate Total Inventory Carry Weight] called: -----")
--     AFUtils.LogPlayerCharacter(playerCharacter)
--     LogDebug("------------------------------")
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
