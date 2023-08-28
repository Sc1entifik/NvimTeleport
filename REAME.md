# NVIM Configs And NVIM Teleport Project

## Purpose
I am creating this project to help people like myself set up their NVIM from scratch and to add/remove/swapout plugins/setups without the fear of messing up their installations. 

## Files included
 - teleport.sh - This file allows you to swap your current config out for a standby which lives where you cloned this git repository. If you don't like what you see no worries just run the script again to swap it back.
 - nvim folder which holds the config file structure and lua files.
 - Instructions.md which give you more details about how everything works.

## What Is Teleport?
In short teleport.sh is a bash file which will quickly allow you to swap your config file folder out with a spare stored somewhere NVIM doesn't look.

NVIM always looks for it's config files in the same locations. This means you can have a spare set of configuration files which you know work somewhere NVIM does not look and if you mess up your active config by tinkering with it you can copy your spare config file folder over the one that NVIM uses and there you instantly have a working config again!

If we take this concept one step further when we add new things to our configs that we like we can teleport those configs, Push them to our own GIT repository, swap them back, Do a GIT pull and you have instant version control over your configs. This also allows us to experiment with having configs in different GIT branches and do cool things like pull your GIT setup on any computer you feel like remotely. 

## Why Not Just Use An IDE?
Here are just a few of the reasons to use NVIM over an IDE:

 - NVIM allows you to stay in the command line where you can be more flexible and productive.

 - NVIM keybindings are like no other and once you are used to them it is almost painful to go back to your previous editor/IDE.

 - Lua configs give you the full power of a programming language to configure NVIM. This is both a gift and a curse because while it increases the learning curve for configuration it also gives you endless power to tailor NVIM to your liking with settings, visual themes, and abilities.

 - NVIM is one of the most favored editors out there if not the most favored for good reason. It combines the speed of a terminal text editor with all the power, sytax highlighting, linting, and any other features an IDE can offer.

