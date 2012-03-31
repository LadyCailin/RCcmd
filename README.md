# rccmd
_*a very lightweight and slim replacement for craftbukkit "general" plugins.*_

## what is this?
rccmd is a collection of scripts for [CommandHelper](http://wiki.sk89q.com/wiki/CommandHelper). It was created for a private Minecraft server I help run, because me and the owner both agreed that CommandBook, our previous "general commands" plugin was too bloated for our tastes now, and we have been trying to keep our server a very vanilla-Minecraft experience. I suggested that we try out CommandHelper, and we make our own commands, thus this was born.

## what makes this better than [Essentials](http://dev.bukkit.org/server-modes/Essentials), or [CommandBook](http://dev.bukkit.org/server-mods/CommandBook)?
Nothing, I suppose. It was created because it was less bloated, and gave me a nice project. I personally think both of them are too big. Maybe it's just more vanilla-ish? More lightweight? You tell me.

## what commands does this have?
I suck at documentation, but I suppose a nice little list of commands and their permissions wouldn't hurt.

_Spawn commands_
* /spawn [player], use it to teleport users to the spawn point of the world. there's currently no way to set the world's spawn in CommandHelper's API yet, but when there is, i'll add a /setspawn command.
    * if [player] is provided, it will send [player] to the spawn point.
    * rccmd.spawn: use /spawn command
    * rccmd.spawn.other: use /spawn [player]

_Aliases_
* /ra, just an alias for reloading commandhelper files. mainly used during development.
* /save, just an alias to /save-all.

_AFK commands_
* /afk, which broadcasts a message saying "<playername> is now afk."
    * keep in mind that /afk is a toggle. if you're afk, it'll say "<playername> is no longer afk."
    * afk status is stored in commandhelper persistance.
    * rccmd.afk: use /afk command
* /listafk, which gives you a list of the people currently afk.
    * rccmd.list.afk: use /listafk
_Coordinate-related commands_
* /getpos [player], which tells you (or [player]'s) your coordinates in the current world.
    * rccmd.getpos: use /getpos
    * rccmd.getpos.other: use /getpos [player]
* /sendpos <player>, which sends your current coordinates in the current world to <player>.
    * rccmd.sendpos: use /sendpos

_Ban commands_
* /ban <player> [reason], which bans <player>. if [reason] given, will kick <player> with [reason] before banning.
    * rccmd.ban: use /ban
* /unban <player>, which unbans <player>. duh.
    * rccmd.ban.unban: use /unban
    * aliases: /pardon
* /listbans, which lists the banned players and IP addresses.
    * rccmd.ban.list: use /listbans
    * aliases: /bans, /banlist
