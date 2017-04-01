#/bin/bash

wait=$1
if [[ $wait -ne 0 ]]
  then
    sleep $wait
fi

# Sound
pkill -f "bash /home/eos/.scripts/sound.s[h]"
bash /home/chris/.scripts/sound.sh &
disown

#sudo ln -s /home/eos/.scripts/shutdown.sh /etc/rc0.d/K99shutdown.s && sudo chmod +x /etc/rc0.d/K99shutdown.sh
#sudo ln -s /home/eos/.scripts/shutdown.sh /etc/rc6.d/K99shutdown.s && sudo chmod +x /etc/rc6.d/K99shutdown.sh<Paste>
