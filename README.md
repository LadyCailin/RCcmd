# rccmd
### __a very lightweight and slim replacement for craftbukkit "general" plugins.__

## what is this?
rccmd is a collection of scripts for [CommandHelper](http://wiki.sk89q.com/wiki/CommandHelper). It was created for a private Minecraft server I help run, because me and the owner both agreed that CommandBook, our previous "general commands" plugin was too bloated for our tastes now, and we have been trying to keep our server a very vanilla-Minecraft experience. I suggested that we try out CommandHelper, and we make our own commands, thus this was born.

## what makes this better than [Essentials](http://dev.bukkit.org/server-modes/Essentials), or [CommandBook](http://dev.bukkit.org/server-mods/CommandBook)?
Nothing, I suppose. It was created because it was less bloated, and gave me a nice project. I personally think both of them are too big. Maybe it's just more vanilla-ish? More lightweight? You tell me.

## what commands does this have?
I suck at documentation, but I suppose a nice little list of commands and their permissions wouldn't hurt.

- _Spawn commands_
    - /spawn [player], use it to teleport users to the spawn point of the world. there's currently no way to set the world's spawn in CommandHelper's API yet, but when there is, i'll add a /setspawn command.
        - if [player] is provided, it will send [player] to the spawn point.
        - rccmd.spawn: use /spawn command
        - rccmd.spawn.other: use /spawn [player]

- _Aliases_
    - /ra, just an alias for reloading commandhelper files. mainly used during development.
    - /save, just an alias to /save-all.

- _AFK commands_
    - /afk, which broadcasts a message saying "&lt;playername&gt; is now afk."
        - keep in mind that /afk is a toggle. if you're afk, it'll say "&lt;playername&gt; is no longer afk."
        - afk status is stored in commandhelper persistance.
        - rccmd.afk: use /afk command
    - /listafk, which gives you a list of the people currently afk.
        - rccmd.list.afk: use /listafk
- _Coordinate-related commands_
    - /getpos [player], which tells you (or [player]'s) your coordinates in the current world.
        - rccmd.getpos: use /getpos
        - rccmd.getpos.other: use /getpos [player]
    - /sendpos &lt;player&gt;, which sends your current coordinates in the current world to &lt;player&gt;.
        - rccmd.sendpos: use /sendpos

- _Ban commands_
    - /ban &lt;player&gt; [reason], which bans &lt;player&gt;. if [reason] given, will kick &lt;player&gt; with [reason] before banning.
        - rccmd.ban: use /ban
    - /unban &lt;player&gt;, which unbans &lt;player&gt;. duh.
        - rccmd.ban.unban: use /unban
        - aliases: /pardon
    - /listbans, which lists the banned players and IP addresses.
        - rccmd.ban.list: use /listbans
        - aliases: /bans, /banlist
    - /isbanned &lt;player&gt;, which tells you if &lt;player&gt; is banned or not.
        - rccmd.ban.check: use /isbanned
- _Chat commands_
    - /clear, just prints enough blank lines to "clear" the chat window.
    - /msg &lt;player&gt; &lt;message&gt;, please note that these commands are used for making EasyPM work with commands. soon, rccmd will have it's own private messaging commands without the need for EasyPM.
        - rccmd.pm: use /msg, /tell, or /pm
        - aliases: /tell, /pm
    - /r &lt;message&gt;, messages the person that last PM'd you.
        - rccmd.pm: use /r
- _Gamemode commands_
    - /gamemode [player], toggles game mode. if [player] given, it changes [player]'s mode
        - rccmd.gamemode: use /gamemode
        - aliases: /gm

- _Death related commands_
    - /kill, ;)
        - rccmd.kill: use /kill
    - /killmepleaseohgodplease, actually kills you
        - rccmd.kill: use /killmepleaseohgodplease

- _Math related commands_
    - /calc &lt;equation&gt;, calculates the answer to &lt;equation&gt;
        - rccmd.calc: use /calc

- _Mob commands_
    - /spawnmob &lt;mob&gt; [amount] [location], spawns [amount] [mob]s at [location]. if no [amount], assumes 1. if no &lt;mob&gt;, lists mobs. if no [location], spawns at player cursor location.
        - rccmd.spawnmob: use /spawnmob
        - there is a commandhelper-forced limit of 50 mobs per command. sorry.

- _Player-related commands_
    - /list, lists the players currently on the server.
        - rccmd.list: use list
        - aliases: /players, /who, /online

- _Administration commands_
    - /whitelist, this is actually just the vanilla whitelist command that comes with bukkit. rccmd equivilant coming soon.
        - bukkit.command.whitelist: use /whitelist
    - /whitelist check &lt;player&gt;, checks if &lt;player&gt; is in the whitelist or not.
        - rccmd.whitelist.check: use /whitelist check

- _World commands_
    - /time &lt;current|day|dawn|afternoon|dusk|night&gt; [world], sets [world] to &lt;time&gt;. if no [world] given, uses player's current world.
        - rccmd.time: use /time
    - /weather &lt;off|on|rain|snow|sunny&gt; [world], makes it rain/snow/sunny, whatever, in [world]. if no [world] given, uses current player's world.
        - rccmd.weather: use /weather

- _Miscellaneous commands_
    - /sign &lt;line #&gt; &lt;content&gt;, edits sign &lt;line #&gt; that player is pointing at to say &lt;content&gt;
        - rccmd.sign: use /sign

## where can I get help?
Look on the [website](http://www.rcfreak0.com) for the server in the Minecraft category, then go to the [RCcmd topic](http://rcfreak0.com/viewtopic.php?f=1&t=46). Or, talk to me on the [IRC channel](irc://irc.efnet.org/#rcfreak0), on EFNet at #rcfreak0. If you've got a bug or feature request, create a request or issue in the Issues section.

## credits
- Developers
    - Hunterm \<hunterm.haxxr@gmail.com\>
- Bits and Pieces
    - Auztin - Gave me some help with making /seen and the _time function work
    - DeanDip - Used his [AFK command, and his listbans](http://forum.sk89q.com/threads/commandhelper-only-commands.437/), since at the time I didn't completely understand CH arrays
- Ideas
    - rcfreak0 - /seen
    - i probably forgot some people, darn you brain!
