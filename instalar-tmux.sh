#!/bin/bash
apt update && apt install tmux -y

tee -a /root/.bashrc << END
tmux has-session -t SESSAOPAI &> /dev/null
if [ \$? != 0 ]
  then
    tmux new-session -s SESSAOPAI -n script -d
fi
tmux attach -t SESSAOPAI
END

# bash <(curl -s https://raw.githubusercontent.com/wzuqui/wzuqui/main/instalar-tmux.sh)
