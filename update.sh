#!/bin/bash
MYVIM=$HOME'/repos/myvim/.vim/bundle'
ls -la $MYVIM|awk '{print $9}'|xargs -I % git fetch $MYVIM/'%'
