##===============================================================================
##
##   Sample external MethodScript include
##
##===============================================================================


##Returns the distance between two blocks, or any other 3d points, for that matter
proc(_3d_distance, @arr1, @arr2,
    return(
        floor(
            sqrt(
                add(
                    pow(subtract(@arr2[0], @arr1[0]), 2),
                    pow(subtract(@arr2[1], @arr1[1]), 2),
                    pow(subtract(@arr2[2], @arr1[2]), 2)
                )
            )
        )
    )
)

##Given two blocks, iterates through all the blocks inside the cuboid, and calls the 
##user defined function on them. The used defined procedure should accept 3 parameters,
##the x, y, and z coordinates of the block.
proc(_iterate_cuboid, @b1, @b2, @proc_name,
    for(assign(@x, min(@b1[0], @b2[0])), lte(@x, max(@b1[0], @b2[0])), inc(@x),
        for(assign(@y, min(@b1[1], @b2[1])), lte(@y, max(@b1[1], @b2[1])), inc(@y),
            for(assign(@z, min(@b1[2], @b2[2])), lte(@z, max(@b1[2], @b2[2])), inc(@z),
                call_proc(@proc_name, @x, @y, @z)
            )
        )
    )
)

proc(_consolereport, @message,
    console(concat('§2[rccmd]§f ',  @message), false)
)

proc(_checkforperm, @perm,
    if(not(equals(player(), '~console')),
        if(has_permission(concat('rccmd.', @perm)),
            _consolereport(concat('§2', player(), '§f has the permission §6rccmd.', @perm, '§f! Access granted.')),
            _consolereport(concat('§c', player(), '§f does not have the permission§2 ', 'rccmd.', @perm, '§f! Access denied.'))
            include('lib.library/config.msa')
            die(@no_permission_error)
        )
    )
)

proc(_ircbc, @message,
    include('lib.library/config.msa')
    assign(@message, strip_colors(@message))
    if(equals(to_lower(@irc), 'true'),
        true,
        assign(@broadcast_to_irc, 'false')
    )
    if(equals(to_lower(@broadcast_to_irc), 'true'),
        ifelse(
            equals(to_lower(@irc_plugin), 'craftirc'),
                runas(~console, concat('/ircraw ', @craftirc_botid, ' PRIVMSG ', @irc_channel, ' :', @message)),
            equals(to_lower(@irc_plugin), 'monsterirc'),
                runas(~console, concat('/irc raw ', 'PRIVMSG ', @irc_channel, ' :', @message))
            equals(to_lower(@irc_plugin), 'minecraftbot'),
                runas(~console, concat('/irc say ', @message))
        ),
        true
    )
)

proc(_consolebc, @message,
    if(equals(to_lower(@broadcast_to_console), 'true'),
        console('§2[rccmd]§f '.@message, false)
        true
    )
)

proc(_gamebc, @message,
    if(equals(to_lower(@broadcast_to_game), 'true'),
        broadcast(@message)
    )
)

proc(_time,
    assign(@epoch, time())
    assign(@minute, divide(@epoch, 60))
    assign(@hour, divide(@minute, 60))
    assign(@day, divide(@hour, 24))
    assign(@week, divide(@day, 7))
    assign(@month, divide(@week, 4))
    assign(@year, divide(@month, 12))
    assign(@decade, divide(@year, 10))
    assign(@century, divide(@decade, 10))
    assign(@second, expr(@epoch.'%60'))
    assign(@minute, expr(@minute.'%60'))
    assign(@hour, expr(@hour.'%20'))
    assign(@day, expr(@day.'%7'))
    assign(@week, expr(@week.'%4'))
    assign(@month, expr(@month.'%12'))
    assign(@year, expr(@year.'%10'))
    assign(@decade, expr(@decade.'%10'))
    ifelse( equals(@month, 1),
            assign(@month_word, 'January'),
            equals(@month, 2),
            assign(@month_word, 'Feburary'),
            equals(@month, 3),
            assign(@month_word, 'March'),
            equals(@month, 4),
            assign(@month_word, 'April'),
            equals(@month, 5),
            assign(@month_word, 'May'),
            equals(@month, 6),
            assign(@month_word, 'June'),
            equals(@month, 7),
            assign(@month_word, 'July'),
            equals(@month, 8),
            assign(@month_word, 'August'),
            equals(@month, 9),
            assign(@month_word, 'September'),
            equals(@month, 10),
            assign(@month_word, 'October'),
            equals(@month, 11),
            assign(@month_word, 'November'),
            equals(@month, 12),
            assign(@month_word, 'December')
    )
)
