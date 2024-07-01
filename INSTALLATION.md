# Please Fork This Project
In order to use this project you will need to first fork the project to your projects and then clone it from the fork. This is so that when you are pushing your git configs you are pushing them to your repository and not mine. If you push your configs to my repository they will be rejected and your config will not be saved!

## Introduction
Whether you are relatively new to NVIM or are an NVIM and command line wizard with years of experience you are probably aware that creating a new NVIM config from scratch or trying to add features and plug-ins to your current NVIM configuration is a tedious and daunting task full of pitfalls where one false move leave you surrounded by a sea of error messages that are not clear how to fix. You try to follow a tutorial on You Tube from scratch and do everything to the letter only to get endless error messages and can't get the LSPs working. You try a premade config only to find it is super lame, full of bloat and features you don't want/need. You may even be at that sad point where you are considering tapping out, going back to VS Code and telling yourself that it is not that much worse because you can use NVIM keybindings.

I was in your boat too so I made this project. It helped me configure my NVIM and it can help you as well.

## Installation Steps
Sadly I cannot take all the complexity from getting NVIM to install and work correctly however I can tell you if you follow these steps to the letter you will have a working NVIM config, version control over it, the confidence and ability to load it and get it working on any computer quickly. Each step listed in bold will have it's own section written for it.

1. Fork this project into your github and then clone it onto your computer from your github.
2. **Install NVIM. Yes Actually Do This**
3. **Installing Ripgrep For Telescope Support Optional But Worth It**
4. **Configure teleport.sh**
5. **Teleporting Our Config**


## Install NVIM. Yes actually Do This
Whether you are using Windows or Linux you will want to have the newest version of NVIM installed. This will be the biggest pain point getting an NVIM config to work correctly. Go to the following site [https://github.com/neovim/neovim/wiki/Installing-NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

You will fall into one of two buckets.

1. You are a Windows user. Everything should be pretty easy for you.
2. You are a Linux user. The NVIM people expect you to somehow know everything in advance and leave you fumbling around in the dark.

### The Linux Bucket
If you are using Linux NVIM will most likely be included in your repositories however this will be an old version of NVIM and everything you want to work in your config may and probably won't work without a newer version of NVIM. You will want to get the newest version of NVIM and you will want to uninstall your current working version of NVIM that your repository uses.


#### Uninstalling NVIM
Enter the follwing terminal command ```sudo apt-get remove neovim```. Once the terminal gets done doing it's thing you will want to verify that NVIM is no longer on your system. To do this run ```nvim``` from the terminal which should return an error do to NVIM not existing. 


#### Download The Newest Version Of NVIM
Go to the following website [https://github.com/neovim/neovim/wiki/Installing-NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim) then click the link in the For Users section. On this page there should be a link called Download a binary under the User heading. Click this link. This will take you to the newest NVIM version git hub page. Scroll down this page until you see Linux(x64) listed. Under this heading you should see yet another link taking you to a releases page. Confusing I know but click this link as well. This will take you to yet another git hub page containing a readme with links cryptically talking about unsupported builds and supported builds. Click the link for unsupported builds and this will take you to yet another git hub releases page. We are almost there I promise! Scroll past all of their instructions and download the nvim.appimage file to the folder where you cloned NVIM Teleport project.


#### Establishing Our Runtime Path
Next we will find a runtime path for our nvim.appimage file. This allows us to execute an executable file from anywhere in our system without it having to be in the location from where the command is executed. In the folder where you cloned the NVIM Teleport project there should be a file called current_nvim_filepath.txt if there is not create it by executing ```touch current_nvim_filepath.txt```. This file stores the runtime path we choose to run our nvim appimage from.  Execute the ```echo $PATH``` command in the terminal. This will print a list of paths from which an executable will run from anywhere on your system. Choose one of these paths it doesn't matter which one and save it in current_nvim_filepath.txt. This file will allow us to see where we are keeping our nvim executable path as well as access that path programatically from the command line. Test this file by using the following command ```ls $(<current_nvim_filepath.txt)``` this will pipe the contents of current_nvim_filepath.txt to the ls command. Assuming you typed the filepath in current_nvim_filepath.txt correctly and saved it the contents of the runtime path should be displayed on your screen. 


#### Making NVIM Executable
You should now have a runtime path saved in current_nvim_filepath.txt as well as an nvim.appimage file. The next step is make our nvim.appimage file executable. Go to the project folder where nvim.appimage file is located and execute the following command ```chmod u+x nvim.appimage && mv nvim.appimage nvim```. The command before ```&&``` makes nvim.appimage an executable file. The command after ```&&``` changes the name of the file to just nvim so that when we type ```nvim``` in the terminal nvim will execute. Verify that it opens by running ```nvim``` from the terminal. The new version of nvim should open up. Once you verify it opens just close it. If it does not open make sure you are in the same path as the nvim.appimage file. 


#### Finishing Our NVIM Installation
Finally we will move our NVIM executable file to the runtime path we saved earlier by executing the following command ```mv nvim $(<current_nvim_filepath.txt)```. This will pipe the contents of current_nvim_filepath.txt to the destination of the mv command moving our nvim appimage file to the location stored there. Finally test your installation by moving to several locations in your terminal and trying the nvim command to test that NVIM will execute from any path in the terminal. If it does do a git push to lock in that runtime filepath you saved. It is now time to celebrate and grab a beverage because the difficult part is over. The rest of your NVIM configuration and installation will be way easier than this!


## Installing Ripgrep For Telescope Support Optional But Worth It
There is a feature that is installed in the NVIM configuration I provided called Telescope fuzzy finder. It has a powerful option of being able to fuzzy find files containing regex patterns. The configuration will work without this feature. However being able to find all instances in your codebase containing the use of a class method or function is very powerfull. To get it to work you need to install the BurntSushi/ripgrep dependency [https://github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep). Simply go to the README.md, click the installation link and scroll down to find your operating system and follow the instructions. If you are a Debian user I recommend using the curl command followed by the sudo dpkg command that they provide so you don't get an outdated version. 

For instructions on how to use the Telescope fuzzy finder after it is installed read the INSTRUCTIONS.md file.  


## Configuring teleport.sh
The teleport.sh file swaps the nvim folder that holds the config which is stored where you cloned this project with the folder that currently holds the actual NVIM config nvim. In order to do this you need to find out where your NVIM installation looks for it's configuration.

There are two methods for this.:
- Inside The Command Line: ```nvim --headless -c 'echo stdpath("config")' -c 'quit'```
- Inside Of NVIM: ```:echo stdpath("config")```

Now that you have this path copy it then open teleport.sh with NVIM and paste it in the nvim_config_folder variable then save teleport.sh. Now when you execute ```./teleport.sh``` your config will swap with the config included in this project.


## Teleporting Our Config
After following the above steps the next thing to do is teleport the NVIM installation using the teleport.sh bash file. See INSTRUCTIONS.md for how to use teleport.sh. Once teleprot.sh exchanges your current NVIM config with the one included with this project all that needs done is to fire up NVIM and the LUA configuration should load by istelf. Once this is done close NVIM and then open a file that you are currently coding with NVIM. You should already see some of the effects of the new installation in action.

### There Will Be Errors
Run the ```:checkhealth``` command from inside of NVIM. This will run a diagnostic of everything installed and return what is working or not working as well as error codes. It will be likeley you have some error codes for something somewhere. Don't worry this is to be expected. Go to the INSTRUCTIONS.md file and look for the section entitled :checkhealth Is Your Friend. This will teach you how to troubleshoot your installation using the :checkhealth command.

### Installing LSPs Using Mason
Running the ```:Mason``` command inside of NVIM should bring up a mason.nvim LSP installation menu assuming it installed correctly from your config. Once you bring up this menu use the language filter to look for all the languages you use one at a time and install LSP functionality for them. When you close out of NVIM and reopen a file of the corresponding language extension you should now notice that you have syntax highlighting, linting, and full LSP support while you are coding! 
