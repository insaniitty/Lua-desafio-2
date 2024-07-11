local player_actions = require "utility.player_actions"
local ui = require "utility.ui"
local monster = require "definitions.bosses.monsters"
local lib = require "utility.lib"
local game_actions = require "utility.game_actions"
local warrior = require "definitions.players.warriors"
local boss_actions = require "utility.boss_actions"


ui.utf()

--acoes
player_actions.build()
boss_actions.build()

--header
ui.header()

--selecione jogador
print()
local player_id = game_actions.select_warrior(warrior.list)
local player = warrior[warrior.list[player_id]]

local boss = monster[monster.list[1]]


--Começa o loop do simulador
while true do
  ui.print_player_grid(player, boss)
  

  print("O que vc quer fazer neste turno")  
  local valid_player_actions = player_actions.getValidActions(player)
  
  for i, player_actions in pairs(valid_player_actions) do 
    print(string.format("%d. %s", i, player_actions.description)) 
  end
     
local player_chosen_index = lib.ask()
local player_chosen_actions = valid_player_actions[player_chosen_index]
local is_action_valid = player_chosen_actions ~= nil 


  if is_action_valid then
    player_chosen_actions.execute(player, boss)
  end


  if boss.health <= 0 then
    ui.game_over(player, boss, 1)
    break
  end
  
  if valid_player_actions[player_chosen_index].description ~= "esquivar de um ataque." then
    local valid_boss_actions = boss_actions.getValidActions(boss)
    local boss_chosen_index = math.random(#valid_boss_actions) 
    local boss_chosen_actions = valid_boss_actions[boss_chosen_index] 
    
    boss_chosen_actions.execute(player, boss)  
  end
  


  if player.health <= 0 then
    ui.game_over(player, boss)
    break
  end



end

