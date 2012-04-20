
include('lib.library/config.msa')
if(equals(@rccmd_activated_msg_on_startup, 'true'),
    console(concat('§2[rccmd]§f rccmd created by Hunterm <hunterm.haxxr@gmail.com> activated!'), false),
    true
)

bind(player_join, null, null, @event,
    assign(@player, @event[player])
    assign(@x, array_get(ploc(@event[player]), 0))
    assign(@y, array_get(ploc(@event[player]), 1))
    assign(@z, array_get(ploc(@event[player]), 2))
    assign(@world, pworld(@player))
    assign(@online, array_size(all_players()))
    assign(@time, pworld(@event[player]))
    assign(@xp, ptexp(@event[player]))
    assign(@xplevel, plevel(@event[player]))
    assign(@mode, pmode(@event[player]))
    include('lib.library/config.msa')
    if(equals(@motd_on_join, 'true'),
        tmsg(@event[player], concat(@motd)),
        true
    )
    if(equals(@list_on_join, 'true'),
        call_alias('/list'),
        true
    )
    if(equals(@welcome_on_join, 'true'),
        if(has_value(concat(@event[player], '.welcome')),
            true,
            foreach(all_players(), @pl,
                if(equals(@pl, @event[player]), true,
                    tmsg(@pl, @welcome_message)
                )
            )
            store_value(concat(@event[player], '.welcome'), 'true')
        ),
        true
    )
)

bind(player_death, null, null, @event,
    assign(@player, @event[player])
    assign(@x, array_get(ploc(@event[player]), 0))
    assign(@y, array_get(ploc(@event[player]), 1))
    assign(@z, array_get(ploc(@event[player]), 2))
    assign(@world, pworld(@player))
    assign(@online, array_size(all_players()))
    assign(@time, pworld(@event[player]))
    assign(@xp, @event[xp])
    assign(@xplevel, plevel(@event[player]))
    assign(@mode, pmode(@event[player]))
    include('lib.library/config.msa')
    if(equals(@death_stats, 'true'),
        tmsg(@event[player], @death_stats_message),
        true
    )
)

#bind(player_command, null, null, @event,
#    assign(@player, @event[player])
#    assign(@x, array_get(ploc(@event[player]), 0))
#    assign(@y, array_get(ploc(@event[player]), 1))
#    assign(@z, array_get(ploc(@event[player]), 2))
#    assign(@world, pworld(@player))
#    assign(@online, array_size(all_players()))
#    assign(@time, pworld(@event[player]))
#    assign(@xp, ptexp(@event[player]))
#    assign(@xplevel, plevel(@event[player]))
#    assign(@mode, pmode(@event[player]))
#    assign(@command, @event[command])
#    include('lib.library/config.msa')
#    if(equals(@log_commands, 'true'),
#        console(concat(color(green), '[rccmd] ', color(white), @player, ' used command \'', @command, '\'!')),
#        true
#    )
#)


