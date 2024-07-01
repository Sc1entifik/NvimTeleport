## Follow the INSTALLATION.md File
If you have not done so already follow the INSTALLATION.md file. This will make sure you have everything prepared to make your NVIM config and NVIM Teleport work properly.


## How Do NVIM Configs Work?
Your NVIM code editor is programmed to look for config files in a certain location. It also has a lua parser which will allow it to understand and execute lua commands. There are a lot of poorly written articles about NVIM configs telling you to sloppily put everything into "your init.lua file". This is a bad idea! Since lua is a programming language it allows you to follow the separation of concerns and single responsibility principles. This means you can break up your configuration files into separate concerns putting them into organized subfolders and then link them to your init.lua file keeping your configuration readable and maintainable. You will thank yourself later when you need to troubleshoot your config and you are able to follow the error message to one folder with a name that tells you what all the files in that folder are for and to one file that handles a single responsibility that is only a few lines long instead of a single beheamoth init.lua with all your settings, plugins, and keybindings everywhere.

With this in mind I wrote and organized the starter config included in this project. There is more about this in the **Examine The nvim Folder** section.


## Using teleport.sh
The teleport.sh file is a BASH file which executes a series of command lines in the linux terminal that result in the config in place being swapped with the config that NVIM looks for when it boots up. If this file is not already executable you will need to make it executable with the following command ```chmod u+x teleport.sh```. All you need to do to once teleport.sh is executable is execute it in place using ```./teleport.sh```. You should get a message telling you that the teleport operation was successfull and also tell you the location of your current nvim config location. 


### I Blew My Installation Up! Now What?
This happens from time to time. You add a new plug-in or mess with your keybindings and now nothing works.

- Check the nvim folder where you cloned this project. 
    - If there is a working config that you like sitting there simply execute ```./teleport.sh```. Now your bad config is gone and your working config is in place.
        - Do a ```git pull``` to overwrite the broken config with the config stored in your git repository.
    - Neither config is working
        - Do a ```git pull``` to overwrite the unwanted config with the last working config in your git repository. 
        - Execute ```./teleport.sh``` to swap your bad config for the working config.
        - Do another ```git pull``` to overwrite the broken config.


### I Love This New Plug-In Or Keybinding I Just Installed!
Great you experimented with your configuration and you added stuff you like!

- Go to the nvim folder where you cloned this project.
    - Execute ```./teleport.sh``` to swap your configs so you can push your new config to your repo.
    - Do a ```git push``` to upload your new config to the repository.
    - Execute ```./teleport.sh``` to swap your config back to keep using it.
    - Do a ```git pull``` to overwrite the old config with the new one that was pushed to your repository.


## The Included Config Uses Lazy Vim
I used Lazy Vim as the plug-in manager for the included config. You can use whatever plug-in manager you however I always found that Lazy Vim worked the best for me. 

## Examine The nvim Folder
I recommend taking a bit of time to examine the nvim folder that comes with this project. Yes you can fork the repo, clone it, follow the INSTALLATION.md file, execute teleport.sh, and then never look at it or think about it again. Knowing how to configure your nvim installation, and personalize it to your liking is worth your time however.

When you examine the nvim folder that is included with this project you will notice a file structure inside starting with an init.lua file. There is also a lua subfolder that holds the other subfolders that the first init.lua file links to. 

### Referencing Folders And Files In LUA
First open the first init.lua file. Inside you will notice a bunch of require(subfolder) and require(subfolder.filename) commands. Close the file and then open the subfolders inside the lua folder. You will either find a single init.lua file with all the code to that subfolder or multiple .lua files with different names that all have their own sections of code in them. The first init.lua file inside the nvim folder automatically requries the first lua folder in the file structure after it thus you only need to require a folder by name that is in the lua folder. If you want to link more subfolders or files inside a referenced folder, you separate those with the dot (.) operator. You leave the .lua extension off of the end of the file name you are referencing in a require() function call as well. Also if the file you are requiring from the referenced folder is an init.lua file you don't reference that file and only reference the subfolder before it. This is how we handle separation of concerns in lua making our configuration code cleaner and more maintainable. 

Our initial init.lua file inside the nvim folder calls each of these sections of code sequentially line by line in the order you read them. By naming our subfolders and files within them wisely we also give ourselves a bit of abstraction allowing us to understand what each section of code is doing even if we happen to struggle to understand how a certain function call works in and of itself. If any of this sounds confusing don't worry because it's one of those things that is easier to see than it is to explain. Examine the file structure of the nvim folder and the contents of all the .lua files and everything should "click" for you soon.


### Telescope Fuzzy Finder Keybindings
I tried to make sure that I added as few keybindings as possible to make my config as nice to use for everyone without assuming preferences. There are however two important keybindings involving the Telescope Fuzzy Finder I would like to mention.

- Leader key: ```space bar```
- Find by filename: ```leader ff``` This finds files by their filename.
- Find by regex pattern: ```leader gg``` This finds files with regex patterns. Requires the installation of BurntSushi/ripgrep dependency. See **Installing Ripgrep For Telescpoe Support Optional But Worth It** section in the INSTALLATION.md file


## Use My Configuration Or Roll Your Own
You can use the teleport.sh file from the folder where you cloned this project to from github using the following command ```./teleport.sh```. This will move my configuration where yours used to be and yours where mine was, then open NVIM from anywhere and the lua files in the configuration folders should take care of the rest. I really think I have a nice, simple, clean configuration with sensible keybindings and a nice colorscheme that is powerful but not full of bloat. We have telescope fuzzyfinder with GREP and file name file finding, zero-lsp armed with mason for autocomplete, linting, and formatting, as well as treesitter syntax highlighting. I even installed vertical lines so you can see where all the indentation levels line up. If you hate mine and want to go back no problem. Go back to where you cloned this project from github and run ```./teleport.sh``` again and there you go your old configuration will be right back where it was. You should also experiment making this your own configuration by adding your own plugs, keybindings, and settings knowing if you blow up your config ```./teleport.sh``` and your git hub repository has your back!


## :checkhealth Is Your Friend
When you try to load the configuration for the first time it is likely that there will be errors. Nobody's computer, file structure, or system requirements are the same. Simply go over each error that occurs starting from the top one and address them one by one until you clear them all and you should be good to go. Another thing I want to make note of here is when you are using ```:LspInstall``` or ```:Mason``` commands inside of NVIM to install an LSP server for a language you will have varying levels of success depending on what installers and modules you have already installed behind the scenes. Don't lose heart this is normal. For example a random LSP may need a newer version of a Python module to execute a command than you have currently installed. You will likely see an obscure looking error. You have two choices, try another LSP and see if that works or use what the error logs tell you to troubleshoot this error and fix it. It will usually clue you in to what module or package you need to update/install from the command line to get past that error.

Some troubleshooting tips:

- :checkhealth and :checkhealth <plugName> are your friends. Use these to get the details you need to troubleshoot through your errors

- Try using your exact error and type in the context in which you are getting that error when doing a google search. You are likely not the only person using NVIM that is experiencing your problem. You will get way better results searching "exit code 127 returns 0 when installing JavaServer LSP with Mason" than you will searching "exit code 127 returns 0". 

- When you have a chain of errors address the top one instead of attacking all of them. Many times the first error causes a chain reaction whereby the condition that causes the one underneath it won't happen once the first error is fixed.

- Sometimes it just isn't worth fixing. Your error message is really obscure, you looked high and low but you just can't seem to fix it. While you should strive to get rid of all your errors there are a few times where it just pays to leave sleeping dogs lie. If it's something small like you can't get the linter working for a language you don't use very often and you are otherwise happy programming with your configuration that is all that really matters at the end of the day. 

