#!/bin/bash

nvim_config_folder=~/.config
mkdir SwapZone
mv nvim SwapZone && mv $nvim_config_folder/nvim .
mv SwapZone/nvim $nvim_config_folder
rm -r SwapZone
echo Teleport operation complete. Enjoy your new configuration!
echo configuration location: $nvim_config_folder/nvim
