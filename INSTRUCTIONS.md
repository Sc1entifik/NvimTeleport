# Please Fork This Project 
In order to use this project you will need to first fork the project to your projects and then clone it from the fork. This is so that when you are pushing your git configs you are pushing them to your repository and not mine. If you push your configs to my repository they will be rejected and your configs will not be saved.

## How Do NVIM Configs Work?
Your NVIM code editor is programmed to look for config files in a certain location. It also has a lua parser which will allow it to understand and execute lua commands. There are a lot of poorly written articles about NVIM configs telling you to sloppily put everything into "your init.lua file". This is a bad idea! Since lua is a programming language you should follow the separation of concerns and single responsibility principles and break up your configuration files into separate concerns putting them into organized subfolders and then link them to your init.lua file. This will help you keep your configuration readable and maintainable. You will thank yourself later when you need to troubleshoot your config and you are able to follow the error message to one folder with a name that tells you what all the files in that folder are for and to one file that handles a single responsibility that is only a few lines long instead of a single beheamoth init.lua with all your settings, plugins, and keybindings everywhere.

With this in mind that is how I wrote and organized the starter config included in this project. This might feel overwhelming at first but once you examine and take in the file structure and lua config files one at a time you will quickly see the patterns and organization. There is more about this in the **Examine The nvim Folder** section.


## Finding Your .config Path To Set In teleport.sh
The first thing you will need to do is find the filepath that NVIM looks for the nvim configuration folder. We can do this in two ways and we will cover them both here. 

- Inside The Command Line: ```nvim --headless -c 'echo stdpath("config")' -c 'echo ""' -c 'quit' ```

- Inside Of Nvim: ```:echo stdpath("config")```

Open your teleport.sh file inside the NvimTeleport folder from where you cloned this git project after forking it. Make sure the variable nvim_config_folder matches the path returned from one of the above commands and change it if it does not. 


## For Windows users
If you are a Windows user it's ok none of us are perfect... jk! You will however need to do one of two things in order to get the teleport.sh to work for you.

1. Download and install a Linux style command prompt that runs on your Windows PC. There are a ton of these and articles teaching you how to install them.

2. Examine the contents of teleport.sh and write your own .bat file equivalent that runs in your windows cmd prompt.

I highly recommend option one because the Linux terminal is just nicer to work with than the Windows command prompt IMO. Option two is just as easy though because the bash file is only a few lines long.


## Let's Fire This Thing Up
Let's review the steps we have covered so far and then get our NVIM config up and running!

1. Fork this repository on your Git hub account.
2. Clone this project from your fork of this project.
3. Make sure that teleport.sh has the correct filepath for your nvim config listed in the variable nvim_config_folder.
4. Run the teleport.sh bash script from the command line using the ```./teleport.sh``` command. You may have to use the ```chmod +x teleport.sh``` command to make it executable first. This will swap your current config with the one pulled from the project fork you just cloned.
5. Open nvim. Nvim should detect changes in the config and start downloading all the dependencies it needs and install everything.
6. Once nvim finishes doing it's thing close nvim and then open a file you normally work with in nvim. 
7. Try some stuff. Use the :Mason command to bring up the Mason terminal, follow the interface and install some LSP support for whatever language you are using.
8. It is not uncommon for something somewhere not to work perfectly on the first try. Check the **Known Requirements** section below to make sure your system have those things installed then troubleshoot any gremlins you find with the :checkhealth command inside of nvim. Most of the time it is just a python module that needs to be installed somewhere or something of that nature.

This is pretty much it to get started. 


## How To Use



## Examine The nvim Folder
I recommend you take a bit of time and examine the nvim folder that comes with this project. Yes you can fork the repo, clone it, execute teleport.sh and never look at it or think about it again. Knowing how to configure your nvim installation and personalize it to your liking is worth your time though.

When you examine the nvim folder that comes with this project you will notice a file structure inside starting with an init.lua file. There is also a lua subfolder that holds the other subfolders that the first init.lua file links to. 

If you open the first init.lua file you will notice a bunch of require(subfolder) and require(subfolder.filename) commands. If you open the subfolders inside the lua folder you will either find a single init.lua file with all the code to that subfolder or multiple .lua files with different names that all have their own sections of code in them. The first init.lua file inside the nvim folder automatically requries the first lua folder in the file structure after it thus you only need to require a folder by name that is in the lua folder. If you want to link more subfolders or files inside a referenced folder, you separate those with the dot (.) operator. You leave the .lua extension off of the end of the file name you are referencing in a require() fucntion call as well. Also if the file you are requiring from the referenced folder is an init.lua file you don't reference that file and only reference the subfolder before it. This is how we handle separation of concerns in lua making our configuration code cleaner and more maintainable. 

Our initial init.lua file inside the nvim folder calls each of these sections of code sequentially line by line in the order you read them. By naming our subfolders and files within them wisely we also give ourselves a bit of abstraction allowing us to understand what each section of code is doing even if we happen to struggle to understand how a certain function call works in and of itself. If any of this sounds confusing don't worry because it's one of those things that is easier to see than it is to explain. Examine the file structure of the nvim folder and the contents of all the .lua files and everything should "click" for you soon.


## Use My Configuration Or Roll Your Own
You can use the teleport.sh file from the folder where you cloned this project to from github using the following command ```./teleport.sh```. This will move my configuration where yours used to be and yours where mine was, then open NVIM from anywhere and the lua files in the configuration folders should take care of the rest. I really think I have a nice, simple, clean configuration with sensible keybindings and a nice colorscheme that is powerful but not full of bloat. We have telescope fuzzyfinder with GREP and file name file finding, zero-lsp armed with mason for autocomplete, linting, and formatting, as well as treesitter syntax highlighting. I even installed vertical lines so you can see where all the indentation levels line up. If you hate mine and want to go back no problem just go back to where you cloned this project from github and run ```./teleport.sh``` again and there you go your old configuration will be right back where it was. You should also experiment making this your own configuration by adding your own plugs, keybindings, and settings knowing if you foobar your nvim you can teleport your spare, do a gitpull while the broken config is in the teleport folder which will overwrite the broken config and you are right back to where you were.


## There Will Be Errors
When you try to load the configuration for the first time it is likely that there will be errors. Nobody's computer, file structure, or system requirements are the same. Simply go over each error that occurs starting from the top one and address them one by one until you clear them all and you should be good to go. Another thing I want to make note of here is when you are using :LspInstall command inside of NVIM to install an LSP server for a language depending on what installers and modules you have already installed behind the scenes you may have varying levels of success installing that particular LSP. Don't lose heart this is normal. For example a random LSP may need a newer version of a Python module to execute a command than you have currently installed. You will likely see an obscure looking error. You have two choices, try another LSP and see if that works or use what the error logs tell you to troubleshoot this error and fix it. It will usually clue you in to what module or package you need to update/install from the command line to get past that error.

Some troubleshooting tips:

- :checkhealth and :checkhealth <plugName> are your friends. Use these to get the details you need to troubleshoot through your errors

- Try using your exact error and type in the context in which you are getting that error when doing a google search. You are likely not the only person using NVIM that is experiencing your problem. You will get way better results searching "exit code 127 returns 0 when installing JavaServer LSP with Mason" than you will searching "exit code 127 returns 0". 

- When you have a chain of errors address the top one instead of attacking all of them. Many times the first error causes a chain reaction whereby the condition that causes the one underneath it won't happen once the first error is fixed.

- Sometimes it just isn't worth fixing. Your error message is really obscure, you looked high and low but you just can't seem to fix it. While you should strive to get rid of all your errors there are a few times where it just pays to leave sleeping dogs lie. If it's something small like you can't get syntax highlighting for a language you don't use very often and you are otherwise happy programming with your configuration that is all that really matters at the end of the day. 


## Known Requirements
These are some things you need installed in order to get this configuration to work.

- [https://github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) - This is needed to get telescope file searching by GREP working. This feature is incredibly useful. shortcut ```<leader>gg```

- [https://github.com/neovim/neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) - If you installed NVIM from your linux repository you probably have a fairly old version of NVIM. Get the newest or you will run into a bunch of cool stuff that you want working not working. Go to the Releases link on this site and get the newest development build. 

### For Linux NVIM Users:
You will want to install the AppImage from the above github neovim link to get the newest version of neovim to make sure everything we want to do works well. The instructions they provide are rather anemic however. They will tell you to run ```chmod u+x nvim.appimage``` followed by ```nvim.appimage``` to verify that it does open. Their instructions end here leaving you only able to open the new version of neovim from one location. Assuming you want to open the new version of nvim outside of where the nvim.appimage file is located what you want to do next is remove your old nvim installation with ```sudo apt-get remove neovim```. Once the old nvim is gone verify that running ```nvim``` in the terminal returns an error because nvim is not installed. Next find a runtime path where you want your new nvim to reside. Run ```echo "$PATH"``` which will print you a list of paths where you can place your nvim.appimage file. Choose one and copy the filepath. Next open a file included in your installation called current_nvim_filepath.txt. Paste that filepath in there, save it, then close. This file won't do anything however when you want to update your nvim again you will need to remember where you put your old nvim AppImage so you can overwrite it with the new one. Now we are almost there. Next run ```mv nvim.appimage nvim``` which changes the name of nvim.appimage to nvim and then finally ```mv nvim nvim_filepath_here``` where of course you paste the actual filepath I had you choose in the earlier step. Verify everything is working by running ```nvim```. This time nvim should open diplaying the new version number.  
