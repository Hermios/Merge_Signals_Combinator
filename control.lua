require "__Hermios_Framework__.control-libs"
require "constants"
require "prototypes.merge-signal-combinator"

table.insert(list_events.on_gui_opened,function(event)
    if event.entity and event.entity.name==prototype then
       game.get_player(event.player_index).opened=nil
    end
end)