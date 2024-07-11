local player_actions = {}

player_actions.list = {}

function player_actions.build(playerData, bossData)
    player_actions.list = {}

--ataque de espada
   local swordAttack = {

        description = "Ataque de espada.",
        requirement = nil,
    --Chande de sucesso do ataque 
        execute = function(playerData, bossData)
            local succesChance = bossData.speed == 0 and 1 or playerData.speed / bossData.speed 
            local succes = math.random () <= succesChance
    --Calculo de dano
            local rawDamage = playerData.attack - math.random() * bossData.defense
            local damage = math.max(1, math.ceil (rawDamage))
    --aplica o dano        
            if succes then
                bossData.health = bossData.health - damage
            end
        end

   }
   --esquivar do ataque inimigo 
        local dogde = {
            description = "esquivar de um ataque.",
            requirement = nil,
    --Chande de sucesso do dogde 
        execute = function(playerData, bossData)
         return
     end
     }


   -- Usar poção de regeneração de vida
    local regenPotion = {
        
        description = "Usar uma poção de regeneração de vida.",
        requirement = function(playerData)
            return playerData.potions >= 1
            end,

        --Tirar a pot de vida do invetario 
        execute = function(playerData)
            playerData.potions = playerData.potions - 1

            --Recuperar vida
            local regenPoints = math.random(1, 10)
            playerData.health = math.min(playerData.maxhealth, playerData.health + regenPoints)
        end

    }



    --Populate list
    player_actions.list[#player_actions.list + 1] = swordAttack
    player_actions.list[#player_actions.list + 1] = regenPotion
    player_actions.list[#player_actions.list + 1] = dogde

end


function player_actions.getValidActions(playerData)
    local validActions = {}
    for _, player_actions in pairs(player_actions.list) do
        local requirement = player_actions.requirement
        local isvalid = requirement == nil or requirement(playerData)
        if isvalid then
            validActions[#validActions+1] = player_actions
        end
    end
    return validActions
end





return player_actions