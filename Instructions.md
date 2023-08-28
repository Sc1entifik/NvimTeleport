## How Does Your NVIM Configs Work?
Your NVIM code editor is programmed to look for config files in a certain location. It also has a lua parser which will allow it to understand and execute lua commands.You will see a lot of beginner NVIM config articles telling you to put everything into "your init.lua file" as if you should only have one config file. This is a bad idea! Since lua is a programming language you should follow the separation of concerns and single responsibility principles by breaking up your configuration linking your init.lua file to other subfolders deeper in your config file structure which will help keep your configurations readable and maintainable. You will thank yourself later when something breaks and you are able to follow the error message to one folder with a name that tells you what all the files in that folder are for and to one file that handles a single responsibility only a few lines long instead of a single beheamoth init.lua with all your settings, plugins, and keybindings everywhere.


## Finding Your .config Path To Set In teleport.sh
The first thing you will need to do is find the filepath that NVIM looks for the nvim configuration folder. We can do this in two ways and we will cover them both here. 

- Inside The Command Line: ```nvim --headless -c 'echo stdpath("config")' -c 'echo ""' -c 'quit' ``````

- Inside Of Nvim: ```:echo stdpath("config")``````

Open your teleport.sh file inside the NvimTeleport folder where you cloned this git project. Make sure the variable nvim_config_folder matches the path returned from one of the above commands and change it if it doesn't. 


## For Windows users
If you are a Windows user it's ok none of us are perfect... jk! You will however need to do one of two things in order to get the teleport.sh to work for you.

- Download and install a Linux style command prompt that runs on your Windows PC. There are a ton of these and articles teaching you how to install them.

- Examine the contents of teleport.sh and write your own .bat file equivalent that runs in your windows cmd prompt.

If I were in your shoes I would probably opt for option one because once you get used to working in a Linux command prompt you won't want to go back. Option 2 is the simpler and shorter way to get what you need for this use case however.


## Examine The nvim Folder From This Codebase. 
When you examine the nvim folder that comes with this project you will notice a file structure inside starting with an init.lua file. There is also a lua subfolder that holds the other subfolders that the first init.lua file links to. If you open the first init.lua file you will notice a bunch of require(subfolder) and require(subfolder.filename) commands. If you open the subfolders inside the lua folder you will either find a single init.lua file with all the code to that subfolder or multiple .lua files with different names that all have their own sections of code in them. The first init.lua file inside the nvim folder automatically requries the first lua folder in the file structure after it thus you only need to require a folder by name that is in the lua folder. If you want to link more subfolders or files inside a referenced folder, you separate those with the . operator. You leave the .lua extension off of the end of the file name you are referencing in a require() fucntion call as well. Also if the file you are requiring from the referenced folder is an init.lua file you don't reference that file and only reference the subfolder before it. This is how we handle separation of concerns in lua making our configuration code cleaner and more maintainable. Our initial init.lua file inside the nvim folder calls each of these sections of code sequentially line by line in the order you read them. By naming our subfolders and files within them wisely we also give ourselves a bit of abstraction allowing us to understand what each section of code is doing even if we happen to struggle to understand how a certain function call works in and of itself. If any of this sounds confusing don't worry because it's one of those things that is easier to see than it is to explain. Examine the file structure of the nvim folder and the contents of all the .lua files and everything should "click" for you soon.


## Use My Configurations Or Roll Your Own
You can use the teleport.sh file to move my configuration where yours used to be, then open NVIM from anywhere and the files in the configuration files should take care of the rest. I really think I have a nice, simple, clean configuration with sensible keybindings and a nice colorscheme that is powerful but doesn't have too much jazz. We have telescope fuzzyfinder with GREP and file name file finding, zero-lsp armed with mason for autocomplete, linting, and formatting, as well as treesitter syntax highlighting. If you hate mine and want to go back no problem just go back to where you cloned the files from github and run teleport.sh again and there you go your old configuration will be right back where it was. You should also experiment making this your own configuration by adding your own plugs, keybindings, and settings knowing if you foobar your nvim you can teleport your spare, do a gitpull overwriting the broken config and you are right back to where you were.


## There Will Be Errors
When you try to load the configuration for the first time it is likely that there will be errors. Nobody's computer, file structure, or system requirements are the same. Simply go over each error that occurs starting from the top one and address them one by one until you clear them all and you should be good to go. Another thing I want to make note of here is when you are using :LspInstall command inside of NVIM to install an LSP server for a language depending on what installers and modules you have already installed behind the scenes you may have varying levels of success installing that particular LSP. Don't lose heart this is normal. For example a random LSP may need a newer version of a Python module to execute a command than you have currently installed. You will likely see an obscure looking error. You have two choices, try another LSP and see if that works or use what the error logs tell you to troubleshoot this error and fix it. It will usually clue you in to what module or package you need to update/install from the command line to get past that error.

Some troubleshooting tips:

- :checkhealth and :checkhealth <plugName> are your friends. Use these to get the details you need to troubleshoot through your errors

- Try using your exact error and type in the context in which you are getting that error when doing a google search. You are likely not the only person using NVIM that is experiencing your problem. You will get way better results searching "exit code 127 returns 0 when installing JavaServer LSP with Mason" than you will searching "exit code 127 returns 0". 

- When you have a chain of errors address the top one instead of attacking all of them. Many times the first error causes a chain reaction whereby the condition that causes the one underneath it won't happen once the first error is fixed.

- Sometimes it just isn't worth fixing. Your error message is really obscure, you looked high and low but you just can't seem to fix it. While you should strive to get rid of all your errors there are a few times where it just pays to leave sleeping dogs lie. If it's something small like you can't get syntax highlighting for a language you don't use very often and you are otherwise happy programming with your configuration that is all that really matters at the end of the day. 


## Known Requirements
These are some things you need installed in order to get this configuration to work.

- [https://github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) - This is needed to get telescope file searching by GREP working. This feature is incredibly useful. shortcut "<leader>gg"

- [https://github.com/neovim/neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) - If you installed NVIM from your linux repository you probably have a fairly old version of NVIM. Get the newest or you will run into a bunch of cool stuff that just won't work. Go to the Releases link on this site and get the newest development build. 

For Linux Users:
Make sure you use the AppImage. The instructions after that point are rather aenemic. What you want to do is run ```chmod u+x nvim.appimage``` followed by ```nvim.appimage``` to verify that it does open. However what you want to do next is to ```apt-get remove nvim``` to remove the previous nvim from your system. Once the old nvim is gone verify this step by trying to open nvim again you should get an error telling you that nvim is not installed. Next find a runtime path you want your new nvim to reside. Run ```echo "$PATH"``` which will print you a list of paths where you can place your nvim.appimage file. Choose one and copy the filepath. Next open a file included in your installation called current_nvim_filepath.txt. Paste that filepath in there save it and close. This file won't do anything however when you want to update your nvim again you will need to remember where you put your old nvim AppImage so you can overwrite it with the new one. Now We are almost there. Next run ```mv nvim.appimage nvim``` which changes the name of nvim.appimage to nvim and then finally ```mv nvim <nvim_filepath>``` where of course you paste the actual filepath I had you choose in the earlier step. Verify everything is working by typing trying to open nvim with the nvim command once you see it open also check the version number just to make sure.  
