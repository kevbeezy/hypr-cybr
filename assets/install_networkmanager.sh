#!/bin/bash

yay -S NetworkManager --needed --noconfirm --answerclean All --answerdiff None
sudo pacman -S nm-connection-editor --needed --noconfirm
