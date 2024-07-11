local warriors = require "definitions.players.warriors"
local player_actions =  require "utility.player_actions"
local ui = require  "utility.ui"
local lib =  require "utility.lib"

local game_actions = {}




function game_actions.select_warrior(warrior_list)
    local user_input = 0
    local warrior_counter = #warrior_list
 
   ui.header(1)
 
       repeat 
           print (
       [[ 
 
          Escolha o seu lutador para usar em batalha
 
       ]]
    
          )
  
          for k, v in ipairs(warrior_list) do
          print(string.format("%s - %s", k, warriors[v].name))
       end
       
       print()
       
       user_input = lib.ask()
       
       until (user_input > 0 and user_input <= warrior_counter)
          
       return user_input
    end
 

return game_actions