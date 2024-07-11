local lib = require "utility.lib"
local monster = require "definitions.bosses.monsters"
local warriors = require "definitions.players.warriors"


local ui = {}


-- Habilita UTF-8 isso faz os emojis e acentos funcionarem
function ui.utf()
    os.execute ("chcp 65001")
end

--limpa a tela
function ui.clear()
    os.execute ("cls")
end 


--Header
function ui.header(param)
    
    local extra = param or 0
    ui.clear()

    print([[

    ================================================================================

               /\                                                 /\
               )( ______________________   ______________________ )(         
    (_)///////(**)______________________> <______________________(**)\\\\\\\(_)
               )(                                                 )(
               \/                                                 \/

    -------------------------------------------------------------------------------            
                            ⚔  SIMULADOR DE BATALHA  ⚔
    ]])

    if extra == 1 then
    print([[
    -------------------------------------------------------------------------------
                           Pegue a sua arma e se prepare
                              Está na hora do duelo
    -------------------------------------------------------------------------------
    ]])
    end

    print([[
    ================================================================================]])
              
end



-- mensagem de vitoria e game over
function ui.game_over(player, monster, type)
    ui.header()

    if type == 1 then
        print([[
     
                     ⚔Parabens vc consegui ganhar a batalha⚔
    ================================================================================ 


]])
    else
        print([[

                     ⚔Parabens vc falhou q nem uma mero pato⚔
    ================================================================================ 

]])
    end
end

function ui.print_player_grid(player, monster)
    ui.header()

    lib.print_line(player.name, monster.name)
    lib.print_line(player.description, monster.description)
    lib.print_line(' ', ' ')

    for _, v in pairs(warriors.atributes) do
        local nSpaces = lib.addSpaces(utf8.len(v), 10)

        lib.print_line(v .. nSpaces .. lib.getProgressBar(player[v]), v .. nSpaces .. lib.getProgressBar(monster[v]), 1)

        if (v=='health') then
            lib.print_line(' ', ' ')
        end
    end

    lib.print_line(' ', ' ')
    print('    ================================================================================')
    print()
end


return ui