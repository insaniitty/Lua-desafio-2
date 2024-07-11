local boss_actions = {}

boss_actions.list = {}

function boss_actions.build(playerData, bossData)
    boss_actions.list = {}

--ataque que esmmaga o oponemte
   local trample = {

        description = "Ataque que esmmaga o inimigo.",
        requirement = nil,
    --Chande de sucesso do ataque 
        execute = function(playerData, bossData)
            local succesChance = playerData.speed == 0 and 1 or bossData.speed / playerData.speed 
            local succes = math.random () <= succesChance
    --Calculo de dano
            local rawDamage = bossData.attack - math.random() * playerData.defense
            local damage = math.max(1, math.ceil (rawDamage))     
    --aplica o dano        
            if succes then
            playerData.health = playerData.health - damage
         end

end
   }
    --uma baforada de acida
        local corruption_breath = {
        description = "Uma baforada acida.",
        requirement = nil,
    --Chande de sucesso do ataque 
        execute = function(playerData, bossData)
            local succesChance = playerData.defense == 0 and 1 or bossData.defense / playerData.defense 
            local succes = math.random () <= succesChance
    --Calculo de dano
            local rawDamage = bossData.attack - math.random() * playerData.speed
            local damage = math.max(1, math.ceil (rawDamage))
    --aplica o dano        
            if succes then
            playerData.health = playerData.health - damage
        end
end

}

    --Populate list
     boss_actions.list[#boss_actions.list + 1] = trample
     boss_actions.list[#boss_actions.list + 1] = corruption_breath

end


function boss_actions.getValidActions(bossData)
    local validActions = {}
    for _, boss_actions in pairs(boss_actions.list) do
        local requirement = boss_actions.requirement
        local isvalid = requirement == nil or requirement(bossData)
        if isvalid then
            validActions[#validActions+1] = boss_actions
        end
    end
    return validActions
end





return boss_actions