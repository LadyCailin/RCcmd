#===============================================================================
#
#   Sample external MethodScript include
#
#===============================================================================

#Returns the distance between two blocks, or any other 3d points, for that matter
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

#Given two blocks, iterates through all the blocks inside the cuboid, and calls the 
#user defined function on them. The used defined procedure should accept 3 parameters,
#the x, y, and z coordinates of the block.
proc(_iterate_cuboid, @b1, @b2, @proc_name,
    for(assign(@x, min(@b1[0], @b2[0])), lte(@x, max(@b1[0], @b2[0])), inc(@x),
        for(assign(@y, min(@b1[1], @b2[1])), lte(@y, max(@b1[1], @b2[1])), inc(@y),
            for(assign(@z, min(@b1[2], @b2[2])), lte(@z, max(@b1[2], @b2[2])), inc(@z),
                call_proc(@proc_name, @x, @y, @z)
            )
        )
    )
)

# proc(_true, equals('1', '1'))
# proc(_false, equals('1', '0'))

proc(_consolereport, @message,
    console(concat('§2[rccmd]§f ',  @message), false)
)

proc(_checkforperm, @perm, if (has_permission(concat('rccmd.', @perm)),
        _consolereport(concat('§2', player(), '§f has the permission §6rccmd.', @perm, '§f! Access granted.'))
        true,
        _consolereport(concat('§c', player(), '§f does not have the permission§2 ', 'rccmd.', @perm, '§f! Access denied.'))
        die('§cYou do not have permission.')
    )
)
