# NVIM Configs And NVIM Teleport Project

## How To Use
IMPORTANT READ THIS!!! Do not directly clone this project with git clone. Instead fork the project to your projects and then clone it from the fork. Otherwise when you git push your configs git will try to push it to my repository  and not yours.

## Purpose
I am creating this project to help people like myself who love NVIM but are tired of worrying about blowing up their configs every time they want to add a plug in or feature. 

## Files included
 - teleport.sh 
    - Bash script which allows you to swap the current config out with the one held in reserve. You can save the reserve config with a git push or overwrite it with a git pull. 
 - nvim folder 
    - Holds the config file structure and lua files. Includes fantastic starter config with no bloat yet has features such as grep fuzzy finder and Mason LSP support. Seriously this config has no bloat!
 - Instructions.md 
    - Detailed project instructions.

## What Is Teleport?
In short teleport.sh is a bash file which will quickly allow you to swap your config file folder out with a spare stored somewhere NVIM doesn't look.

NVIM always looks for it's config files in the same locations. This means you can have a spare set of configuration files which you know work somewhere NVIM does not look and if you mess up your active config by tinkering with it you can copy your spare config file folder over the one that NVIM uses and you instantly have a working config again!

When you add new things to your config that you like you can teleport those configs, and then push them to our own GIT repository giving you instant version control for your configs. This allows you to do cool things like having experimental configs in different GIT branches and pull your GIT setup on any computer you feel like remotely. 

## Why Not Just Use An IDE?
Here are just a few of the reasons to use NVIM over an IDE:

 - NVIM allows you to stay in the command line where you can be more flexible and productive.

 - NVIM keybindings are like no other and once you are used to them it is almost painful to go back to your previous editor/IDE.

 - Lua configs give you the full power of a programming language to configure NVIM. This is both a gift and a curse because while it increases the learning curve for configuration it also gives you endless power to tailor NVIM to your liking with settings, visual themes, and abilities.

 - NVIM is one of the most favored editors out there if not the most favored for good reason. It combines the speed of a terminal text editor with all the power, sytax highlighting, linting, and any other features an IDE can offer.

