#!/bin/bash

#kill -10 $(xprop -id `xdotool getwindowfocus` | \grep '_NET_WM_PID' | \grep -oE '[[:digit:]]*$')

# Adicionar ao bashrc/zshrc
#GALLIUM_HUD_TOGGLE_SIGNAL=10 GALLIUM_HUD_VISIBLE=false GALLIUM_HUD=simple,fps,cpu,memory-clock,shader-clock,temperature,GPU-load steam

kill -n 10 $(ps a|grep steam|grep -v grep|cut -c 1-5)
