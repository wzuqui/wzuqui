#!/bin/bash
apt update && apt install tmux -y

tee -a /root/.bashrc << END
tmux has-session -t SESSIONROOT &> /dev/null
if [ $? != 0 ]
  then
    tmux new-session -s SESSIONROOT -n script -d
fi
tmux attach -t SESSIONROOT
END

# bash <(curl -s https://raw.githubusercontent.com/wzuqui/wzuqui/main/instalar-tmux.sh)
