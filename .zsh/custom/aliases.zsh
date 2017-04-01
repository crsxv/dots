# vim: fdm=marker:noai:ts=4:sw=4

# General {{{

#set display
#  export DISPLAY=:0

# Default terminal emulator
  export TERMINAL="termite"

# Enable Ctrl Alt Backspace
  setxkbmap -option "terminate:ctrl_alt_bksp"

# find alternative apps if it is installed on your system
  find_alt() { for i;do which "$i" >/dev/null && { echo "$i"; return 0;};done;return 1; }

# }}}

# Export Paths {{{

# set the default program
# the first program in the array that is detected on your system will be chosen as the default

  export $USER="/home/chris/"
  export PATH="/usr/local/bin:$HOME/bin:$HOME/.bin:$HOME/.local/bin:$PATH"
  #export PATH="$USER/.bin:$PATH"
  export BROWSER=$(find_alt qutebrowser chromium firefox $OPENER )
  export BROWSERCLI=$(find_alt w3m links2 links lynx elinks $OPENER )
  export COMICER=$(find_alt mcomix comix zathura $OPENER )
  export DOCS=$(find_alt abiword libreoffice $OPENER )
  export EBOOKER=$(find_alt ebook-viewer $OPENER )
  export EDITOR=$(find_alt nvim gvim vim vi emacs nano leafpad gedit pluma $OPENER )
  export FILEMANAGER=$(find_alt nemo thunar pcmanfm nautilus dolphin spacefm enlightenment_filemanager $OPENER )
  export IMAGEVIEWER=$(find_alt ristretto feh display eog $OPENER )
  export MUSICER=$(find_alt mplayer mpg123 mpv cvlc $OPENER )
  export NOTEBOOK=$(find_alt cherrytree keepnote $OPENER )
  export OPENER=$(find_alt xdg-open exo-open gnome-open )
  export PAGER=$(find_alt less more most)
  export PLAYER=$(find_alt mplayer mpv cvlc $OPENER )
  export RANGER_LOAD_DEFAULT_RC=FALSE
  export READER=$(find_alt mupdf evince foxitreader $OPENER )
  export ROOTER=$(find_alt gksudo kdesudo )
  export VISUAL=nvim

# }}}

# Global Aliases {{{

# usage: cp NF ND, cd ND, xdg-open NF, ...etc

  alias -g A='| aspell -a'
  alias -g E='echo'
  alias -g ND='*(/om[1])' 		# newest directory
  alias -g NF='*(.om[1])' 		# newest file
# alias -g NE='2>|/dev/null'
  alias -g NO='&>|/dev/null'
  alias -g P='2>&1 | $PAGER'
  alias -g L='| less'
  alias -g M='| most'
  alias -g C='| wc -l'
  alias -g H='| head'
  alias -g T='| tail'
  alias -g G='| grep'
  alias -g LL="2>&1 | less"
  alias -g CA="2>&1 | cat -A"
  alias -g NE="2> /dev/null"
  alias -g NUL="> /dev/null 2>&1"

# some global aliases for redirection

  alias -g N="&>/dev/null"
  alias -g 1N="1>/dev/null"
  alias -g 2N="2>/dev/null"
  alias -g DN="/dev/null"

# Paging with less / head / tail

  alias -g LS='| less -S'
  alias -g EL='|& less'
  alias -g ELS='|& less -S'
  alias -g TRIM='| cut -c 1-$COLUMNS'
  alias -g H='| head'
  alias -g HL='| head -n $(( +LINES ? LINES - 4 : 20 ))'
  alias -g EH='|& head'
  alias -g EHL='|& head -n $(( +LINES ? LINES - 4 : 20 ))'
  alias -g TL='| tail -n $(( +LINES ? LINES - 4 : 20 ))'
  alias -g ET='|& tail'
  alias -g ETL='|& tail -n $(( +LINES ? LINES - 4 : 20 ))'

# Sorting / counting

  alias -g C='| wc -l'
  alias -g SS='| sort'
  alias -g Su='| sort -u'
  alias -g Sn='| sort -n'
  alias -g Snr='| sort -nr'

# Grep Colored

  alias grep="grep --color=auto"
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  # enable color support of ls and also add handy aliases

  if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  fi

# Help command

  autoload -U run-help
  autoload run-help-git
  autoload run-help-svn
  autoload run-help-svk
  # unalias run-help
  alias help=run-help

#}}}

# Suffixes Aliases {{{

# open file with default program base on extension
# Ex: 'alias -s avi=mplayer' makes 'file.avi' execute 'mplayer file.avi'

  alias -s {avi,flv,mkv,mp4,mpeg,mpg,ogv,webm,wmv}=$PLAYER
  alias -s {flac,mp3,ogg,wav}=$MUSICER
  alias -s {gif,GIF,jpeg,JPEG,jpg,JPG,png,PNG}="$IMAGEVIEWER"
  alias -s {doc,docx,odt}="$DOCS"
  alias -s {djvu,pdf}="$READER"
  alias -s ctd="$NOTEBOOK"
  alias -s txt="$EDITOR"
  alias -s {azw3,epub,mobi,prc}="$EBOOKER"
  alias -s {cbr,cbz}="$COMICER"
  alias -s {at,ch,com,de,net,org,html}="$BROWSER" # might conflict with emacs org mode

#}}}

# Archive Extractor {{{

alias -s ace="unace l"
alias -s rar="unrar l"
alias	-s tar="tar -xzvf"
alias -s zip="unzip -l"

#}}}

# Priviledge Access {{{

  if [ $UID -ne 0 ]; then
  alias dhcpcd='sudo dhcpcd'
  alias fdisk='sudo fdisk -l'
  alias gparted='sudo gparted'
  alias mount='sudo mount -a'
  alias own='sudo chown -R chris'
  alias powertop='sudo powertop'
  alias root='sudo su'
  alias scp='sudo cp'
  alias smv='sudo mv'
  alias srm='sudo rm'
  alias srmr='sudo rm -ri'
  alias rm -R='sudo rm -R'
  alias sudo='sudo'
  alias tlp='sudo tlp'
  alias diskact="sudo iotop -Po"  # disk activity
  alias big='ncdu -x'
  alias wifi-menu='sudo wifi-menu -o wlp2s0'
  alias freemem='sudo /sbin/sysctl -w vm.drop_caches=3'
  alias disks='df -h; btrfs filesystem df /'
  alias err='dmesg -l err; systemctl --failed'
  alias warn='dmesg -l warn'
  alias errors="sudo journalctl -p 0..3 -xn"  # high priority errors
  alias blame='systemd-analyze; systemd-analyze blame'
  alias log='journalctl -f | ccze -A'  # follow log
  alias log0='journalctl -b -0 | ccze -A'  # current log
  alias log1='journalctl -b -1 | ccze -A' # previous log
  fi

# }}}

# System Power {{{

# Power Related

  alias bye='pkill -9 -u chris' #logoff
  alias suspend='systemctl suspend'

# }}}

# Tmux {{{

  alias tmux='tmux -2'
  alias ta='tmux attach -t'
  alias tnew='tmux new -s'
  alias tls='tmux ls'
  alias tkill='tmux kill-server'

# }}}

# Handling Packages {{{

  alias aur='yaourt'
  alias install='sudo pacman -S'
  alias remove='sudo pacman -R'
  alias Remove='sudo pacman -Rsc'
  alias orphans='sudo pacman -Rns $(pacman -Qtdq) ; clear'
  alias pac-all='pacman -Qe'
  alias pac-native='pacman -Qn'
  alias pac-foreign='pacman -Qm'
  alias upgrade-pac='pacman -Syuu'
  alias upgrade-aur='yaourt -Syyua'
  alias y='--noconfirm'

# }}}

# Handling Mirrors {{{

  alias mirrorlist='nvim /etc/pacman.d/mirrorlist'
  alias rft-5='sudo reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
  alias rft-200='sudo reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist'

# }}}

# Basics {{{

  alias c='clear'
  alias cat='pygmentize -g'
  alias ccat='clear ; pygmentize -g'
  alias cl='clear && ls'
  alias cla='clear && la'
  alias clat='clear ; cat'
  alias cll='clear && ll'
  alias cm='sudo chmod +x'
  alias cpr='cp -r'
  alias cputemp='sensors -f | grep Core'
  alias e='exit'
  alias h='history'
  alias k='killall'
  alias md='mkdir -p -v'
  alias pid='pidof'
  alias rmr='rm -r'

#  }}}

# Get Into Directories {{{

  alias autostart='cd ~/.config/autostart && ls'
  alias bin='cd /usr/local/bin && ls'
  alias bk='cd $OLDPWD'
  alias bkup='cd ~/bkup && ls'
  alias cheats='cd ~/.cheat && ls'
  alias code='cd ~/docs/code && ls'
  alias config='cd ~/.config && ls'
  alias desk='cd ~/desk && ls'
  alias docs='cd ~/docs && ls'
  alias dots='cd ~/dots && ls -a'
  alias downl='cd ~/downl && ls'
  alias fm='nemo .'
  alias home='cd ~/ && ls'
  alias lab='cd ~/lab && ls'
  alias lang='cd ~/docs/lang/ && ls'
  alias media='cd /run/media/chris && ls'
  alias mega='cd ~/mega/ && ls'
  alias music='cd ~/music && ls'
  alias notes='cd ~/notes && ls'
  alias pics='cd ~/pics/ && ls'
  alias scripts='cd ~/.scripts && ls'
  alias setup='cd ~/dots/setup && ls'
  alias tb-bibliotheque='cd /run/media/chris/東芝/Bibliothèque/ && ls'
  alias tb-connaissance='cd /run/media/chris/東芝/Connaissance/ && ls'
  alias tb-donnees='cd /run/media/chris/東芝/Données/ && ls'
  alias tb-media='cd /run/media/chris/東芝/Media/ && ls'
  alias tb-sauvegarde='cd /run/media/chris/東芝/Sauvegarde/ && ls'
  alias tb-temporaire='cd /run/media/chris/東芝/Temporaire/ && ls'
  alias tb='cd /run/media/chris/東芝 && ls'
  alias temp='cd ~/temp && ls'
  alias tests='cd ~/tests && ls'
  alias torrents='cd ~/torrents && ls'
  alias trash='cd ~/.local/share/Trash/ && ls'
  alias uni='cd ~/docs/uni && ls'
  alias uni-english='cd ~/docs/uni/english'
  alias uni-faith='cd ~/docs/uni/faith'
  alias uni-logic='cd ~/docs/uni/logic && ls'
  alias uni-math='cd ~/docs/uni/math && ls'
  alias uni-spanish='cd ~/docs/uni/spanish && ls'
  alias vids='cd ~/vids && ls'
  alias xperia='cd /run/user/1000/gvfs/ ; cl'
  alias xsession='cd /usr/share/xsessions ; cl'
e
# }}}

# Extensions {{{

  

# }}}

# Autocolor {{{

  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

#  }}}

# Error Prevention {{{

  alias :q=' exit'
  alias :Q=' exit'
  alias :x=' exit'
  alias cd..='cd ..'
  alias ..='cd ..'

# }}}

# Little Time Savers {{{

  alias c='clear'
  alias h='history'
  alias r='reset'
  alias x='exit'

# }}}

# Listing {{{

  alias ..='cd ..'            # Go up one directory
  alias ...='cd ../..'        # Go up two directories
  alias ....='cd ../../..'    # And for good measure
  alias l='ls'                # Long view, show hidden
  alias la='ls -AF'           # Compact view, show hidden
  alias lsd='ls -d */'        # List only directories
  alias ll='ls -alF'          # Long view, show hidden
  alias lth='ls -1h | head -10' #View last 10
  alias ltt='ls -1t | head -10' #View first 10
  alias lss='ls -lhS ' #Show size of files
  alias lsh='ls -lhXG' # long listing, human-readable, sort by extension, do not show group info
  alias clean_pyc='find . -name "*.pyc" -type f -delete' # pyc cleanup from al subdir

# }}}

# System Admin Stuff {{{

  alias sudo='sudo '
  alias diskact="sudo iotop -Po"  # disk activity
  alias big='ncdu -x'
  alias freemem='sudo /sbin/sysctl -w vm.drop_caches=3'
  alias disks='df -h; btrfs filesystem df /'
  alias err='dmesg -l err; systemctl --failed --all'
  alias usrerr='systemctl --failed --all --user'
  alias warn='dmesg -l warn'
  alias errors="sudo journalctl -p 0..3 -xn"  # high priority errors
  alias blame='systemd-analyze; systemd-analyze blame'
  alias log='journalctl -f | ccze -A'  # follow log
  alias log0='journalctl -b -0 | ccze -A'  # current log
  alias log1='journalctl -b -1 | ccze -A'  # previous log
  alias list='systemctl list-unit-files'
  alias usrlist='systemctl --user list-unit-files'

# Saves journal logs to file
  getlog() { local file=~/logs/system/log-$(date +%Y%m%d-%H:%M).txt; sudo journalctl -b > "$file" && xdg-open "$file"; }

# Flash Coreboot ROM
  alias flash_rom='cd; rm -f ~/flash_chromebook_rom.sh; curl -L -O https://johnlewis.ie/flash_chromebook_rom.sh; sudo -E bash flash_chromebook_rom.sh'

# }}}

# Languages Related {{{

  alias t='trans'
  alias tD='trans -d -v'         #translate one word
  alias tR='trans -R'            #references in english
  alias tt='trans -T'            #references
  alias ti='trans -identify'     #tell which language is
  alias ts='trans -shell -brief' #active shell translator

  alias Ar="t -v -s @ar"  #arabic
  alias De="t -v -s de"   #german
  alias En="t -v -s en"   #english
  alias Es="t -v -s es"   #spanish
  alias Fr="t -v -s fr"   #french
  alias It="t -v -s it"   #italian
  alias Ja="t -v -s @ja"  #japanese
  alias Ko="t -v -s @ko"  #korean
  alias Pt="t -v -s pt"   #portuguese
  alias Ru="t -v -s ru"   #russian
  alias Tr="t -v -s tr"   #turkish
  alias Zh="t -v -s @zh"  #chinese

  alias tts-de='ts :de -p'  #german
  alias tts-en='ts :en -p'  #english
  alias tts-es='ts :es -p'  #spanish
  alias tts-fr='ts :fr -p'  #french
  alias tts-it='ts :it -p'  #italian
  alias tts-ja-日本語='ts :ja -p' #japanese
  alias tts-ja='ts :@ja -p' #japanese (romanji)
  alias tts-ko-한국어='ts :@ko -p' #korean (romanized)
  alias tts-ko='ts :ko -p' #korean
  alias tts-pt='ts :pt -p'  #portuguese
  alias tts-ru='ts :@ru -p' #russian (cyrillic script)
  alias tts-ru-язык='ts :ru -p' #russian (latin script)
  alias tts-tr='ts :tr -p'  #turkish
  alias tts-zh='ts :@zh -p' #chinese (pinyin form)
  alias tts-zh-中文='ts :zh -p' #chinese

  alias nws-english='vim ~/docs/lang/English/en-words.txt'
  alias nws-german='vim ~/docs/lang/Deutsch/de-words.txt'
  alias nws-spanish='vim ~/docs/lang/Español/es-words.txt'
  alias nws-french='vim ~/docs/lang/Français/fr-words.txt'
  alias nws-italian='vim ~/docs/lang/Italiano/it-words.txt'
  alias nws-portuguese='vim ~/docs/lang/Português/pt-words.txt'
  alias nws-russian='vim ~/docs/lang/Pусский/ru-words.txt'
  alias nws-turkish='vim ~/docs/lang/Türkçe/tr-words.txt'

# }}}

# Shortcuts {{{

# Top 10 Commands
  top10() { history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head; }

# Find a file with a pattern in name
  ff() { find . -type f -iname '*'$*'*' -ls ; }

# Find a file with pattern $1 in name and execute $2 on it
  fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \; ; }

# Empty all folders in current directory and miscellanize all files in them
  alias misc='find . -mindepth 2 -type f -exec mv "{}" . \; && find . -type d -empty -delete'

  alias mkshortcut='gnome-desktop-item-edit'

# }}}

# Pac-Man C o o o {{{

  alias U='pacbup; pacupd; pkill -RTMIN+3 i3blocks'  # Pacman backup + upgrade scripts
  alias Us="pacbup; echo 'Pacman sync...'; pacaur -Syy; echo 'done'; pacupd; pkill -RTMIN+3 i3blocks"   # Pacman sync + upgrade
  alias I='pacaur -S' # install
  alias Iu='pacaur -U' #install local package
  alias In='pacaur -S --noedit --noconfirm --needed' #install silently
  alias Pi='pacaur -Si'
  alias Upa='pacaur -Sy && sudo abs'
  alias Id='pacaur -S --asdeps'
  alias Pm='makepkg -fcsi'
  alias Un='pacaur -Su --noconfirm --noedit'
  alias Ud='pacaur -Su --aur --noconfirm --noedit --devel --needed'
  alias S='pacaur -Ss'
  alias Sy='pacaur -Syy'
  alias Pi='pacaur -Si'
  alias Pd='pacaur -d'
  alias Pe='pacaur -e'
  alias R='pacaur -Rns'
  alias Rs='sudo pacaur -Rns $(pacaur -Qtdq)'
  alias Yl='yaourt -Qm'  # local packages
  alias Yf='yaourt -Qet'  # foreign packages
  alias Cc='yaourt -C; sudo pkgcacheclean -v; pacaur -Scc --noconfirm'
  alias pkgaur='pacman -Qemq'
  alias pacdep='pacman -Qdt'
  alias pacexp='pacman -Qet'
  alias upd='pacaur -Qu'
  alias refr='refl; sudo rm -r /var/lib/pacman/db.lck; sudo pacman-key --init; sudo pacman-key --populate archlinux; sudo pacman-key --refresh-keys; sudo pacman-optimize' # Refresh all the things
  alias refl='sudo reflector --verbose --country 'Netherlands' -l 200 -p http --sort age --fastest 3 --save /etc/pacman.d/mirrorlist; cat /etc/pacman.d/mirrorlist'

# }}}

# SSH {{{

  alias osmc='ssh osmc'
  alias pi2='ssh pi2'
  alias pi1='ssh pi1'
  alias box='ssh box'
  alias srv='ssh srv'
  alias wrt='ssh wrt'
  alias home='ssh home'
  alias retro='ssh retropie'

# }}}

# Networking {{{

  alias cwrt='echo Latest AsusWRT-Merlin firmware for RT-N66U: $(curl -s http://asuswrt.lostrealm.ca/download -o /tmp/target.txt; cat /tmp/target.txt | grep RT-N66U_*|xargs|cut -d "_" -f 2); echo Download: https://www.mediafire.com/folder/bkfq2a6aebq68'
  alias lan='sudo dhcpcd enp0s20u1'
  alias nlyzr='wget http://netalyzr.icsi.berkeley.edu/NetalyzrCLI.jar; java -jar NetalyzrCLI.jar; rm NetalyzrCLI.jar'
  alias ping='ping -c 5'
  alias random-mac='sudo ifconfig wlp2s0 down; sudo macchanger wlp2s0 -r; sudo ifconfig wlp2s0 up'
  alias restart-wifi='sudo ifconfig wlp2s0 down; sudo ifconfig wlp2s0 up; sudo  dhcpcd'
  alias scanwifi='sudo iw wlp2s0 interface add mon0 type monitor; sudo horst -i mon0 creset'
  alias wlandown='sudo ip link set dev wlp2s0 down'
  alias wlanup='sudo ip link set dev wlp2s0 up'

# }}}

# Lightdm {{{

alias lightdm-off='sudo systemctl disable lightdm.service'
alias lightdm-on='sudo systemctl enable lightdm.service'

# Crypto {{{

  alias decrypt='mcrypt -u -d'
  alias encrypt='mcrypt -u'

# }}}

# Get Info {{{

  alias arch='clear && neofetch'
  alias keys='xmodmap -pke'
  alias xev="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
  alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
  alias batt='acpi -bt'
  alias sysinfo='sudo inxi -Fflprxxxm'
  alias weather='curl -4 wttr.in/epe,netherlands'

  m-sound() { arecord -L && arecord -l && cat /proc/asound/pcm ;} #List audio capture card/mic
  m-distro() { uname -a && lsb_release -a ;}
  m-connectip() {
      echo "--------------- Connected Devices -----------------"
      nmap -sn $(netstat -rn | awk 'FNR == 3 {print $2}')/24
      echo "---------------------------------------------------"
  }

# }}}

# Quick Edit Config Files {{{
  cfg-aliases() { $EDITOR ~/.zsh/custom/aliases.zsh ;}
  cfg-bashrc() { $EDITOR ~/.bashrc ;}
  cfg-blocklist() { $EDITOR ~/.scripts/blocklist.sh ;}
  cfg-bookmarks-dirs () { $EDITOR ~/.config/user-dirs.dirs ;}
  cfg-bookmarks-gtk() { $EDITOR ~/.config/gtk-3.0/bookmarks ;}
  cfg-chrome-css() {$EDITOR ~/.startpage/styles/style.css ;}
  cfg-chrome-html() { $EDITOR ~/.startpage/index.html ;}
  cfg-chromium-devtoolsize() { $EDITOR ~/.config/chromium/Default/User\ StyleSheets/Custom.css ;}
  cfg-chromium-noscript() { $EDITOR ~/.config/chromium/Default/Extensions/odjhifogjcknibkahlpidmdajjpkkcfn/*/CHANGE__PASSWORD__HERE.js ;}
  cfg-compton() {$EDITOR ~/.compton.conf ;}
  cfg-cursor-list() { ls ~/.icons ;}
  cfg-cursor() { $EDITOR ~/.icons/default/index.theme ;}
  cfg-dircolors() { $EDITOR ~/.dircolors ;}
  cfg-dunst() { $EDITOR ~/.config/dunst/dunstrc ;}
  cfg-emacs() { $EDITOR ~/.emacs ;}
  cfg-emulationstation-input() { $EDITOR ~/.emulationstation/es_input.cfg ;}
  cfg-emulationstation() { $EDITOR ~/.emulationstation/es_systems.cfg ;}
  cfg-firefox() { $EDITOR ~/.startpage.html ;}
  cfg-flexget() { $EDITOR ~/.flexget/config.yml ;}
  cfg-fstab() { sudo $EDITOR /etc/fstab ;}
  cfg-ghsync() { $EDITOR ~/.scripts/ghsync-script.sh ;}
  cfg-giftd() { $EDITOR ~/.giFT/giftd.conf ;}
  cfg-gitignore() { $EDITOR ~/Public/dotfiles/.gitignore ;}
  cfg-group() { sudo $EDITOR /etc/group ;}
  cfg-grub-boot() { sudo $EDITOR /boot/grub/grub.cfg ;}
  cfg-grub-custom() { sudo $EDITOR /etc/grub.d/40_custom ;}
  cfg-grub() { sudo $EDITOR /etc/default/grub ;}
  cfg-hintrc() { $EDITOR ~/.hintrc ;}
  cfg-history() { $EDITOR $HISTFILE ;}
  cfg-hosts() { sudo $EDITOR /etc/hosts ;}
  cfg-i3b() { $EDITOR ~/.i3blocks.conf ;}
  cfg-i3c() { $EDITOR ~/.i3/config ;}
  cfg-inputrc() { $EDITOR ~/.inputrc ;}
  cfg-kodi-confluencethumbnailview() { sudo $EDITOR /usr/share/kodi/addons/skin.confluence/720p/MyVideoNav.xml ;}
  cfg-kodi-favorites() { $EDITOR ~/.kodi/userdata/favourites.xml ;}
  cfg-kodi-keyboard() { $EDITOR ~/.kodi/userdata/keymaps/keyboard.xml ;}
  cfg-laptop-mode() { sudo $EDITOR /etc/laptop-mode/laptop-mode.conf ;}
  cfg-lgogdownloader() { $EDITOR ~/.config/lgogdownloader/config.cfg ;}
  cfg-lightdm() { sudo $EDITOR /etc/lightdm/lightdm-webkit2-greeter.conf ;}
  cfg-livestreamer() { $EDITOR ~/.livestreamerrc ;}
  cfg-lua() { $EDITOR ~/.config/awesome/rc.lua ;}
  cfg-mailcap() { $EDITOR ~/.mailcap ;}
  cfg-mbsyncrc() { $EDITOR ~/.mbsyncrc ;}
  cfg-mc() { $EDITOR ~/.config/mc/ini ;}
  cfg-mcomix() { $EDITOR ~/.config/mcomix/keybindings.conf ;}
  cfg-mpd() { $EDITOR ~/.mpd/mpd.conf ;}
  cfg-mplayer() { $EDITOR ~/.mplayer/config ;}
  cfg-mpv() { $EDITOR ~/.config/mpv/input.conf ;}
  cfg-muttrc() { $EDITOR ~/.muttrc ;}
  cfg-nanorc() { $EDITOR ~/.nanorc;}
  cfg-ncmpcpp-bindings() { $EDITOR ~/.ncmpcpp/bindings ;}
  cfg-ncmpcpp() { $EDITOR ~/.ncmpcpp/config ;}
  cfg-neofetch() { $EDITOR ~/.config/neofetch/config ;}
  cfg-newsbeuter-queue() { $EDITOR ~/.newsbeuter/queue ;}
  cfg-newsbeuter-urls() { $EDITOR ~/.newsbeuter/urls ;}
  cfg-newsbeuter() { $EDITOR ~/.newsbeuter/config ;}
  cfg-pacman-mirrorlist() { sudo $EDITOR /etc/pacman.d/mirrorlist ;}
  cfg-pacman() { sudo $EDITOR /etc/pacman.conf ;}
  cfg-pastebinit() { $EDITOR ~/.pastebinit.xml ;}
  cfg-paths() { $EDITOR ~/.config/user-dirs.dirs ;}
  cfg-percol() { $EDITOR ~/.percol.d/rc.py ;}
  cfg-periscope() { $EDITOR ~/.config/periscope/config ;}
  cfg-pianobar-libao() { sudo $EDITOR /etc/libao.conf ;}
  cfg-pianobar() { $EDITOR ~/.config/pianobar/config ;}
  cfg-power-management() { sudo $EDITOR /etc/systemd/logind.conf ;}
  cfg-profile() { $EDITOR ~/.profile ;}
  cfg-pulseaudio() { sudo $EDITOR /etc/pulse/default.pa ;}
  cfg-pyload() { $EDITOR ~/.pyload/pyload.conf ;}
  cfg-pyradio() { $EDITOR ~/.pyradio.csv ;}
  cfg-quicktile() { $EDITOR ~/.config/quicktile.cfg ;}
  cfg-qutebrowser-keys() { $EDITOR ~/.config/qutebrowser/keys.conf ;}
  cfg-qutebrowser-quickmarks() { $EDITOR ~/.config/qutebrowser/quickmarks ;}
  cfg-qutebrowser() { $EDITOR ~/.config/qutebrowser/qutebrowser.conf ;}
  cfg-ranger-commands() { $EDITOR ~/.config/ranger/commands.py ;}
  cfg-ranger-rifle() { $EDITOR ~/.config/ranger/rifle.conf ;}
  cfg-ranger() { $EDITOR ~/.config/ranger/rc.conf ;}
  cfg-redshift() { $EDITOR ~/.config/redshift.conf ;}
  cfg-retroarch() { $EDITOR ~/.config/retroarch/retroarch.cfg ;}
  cfg-rtv() { $EDITOR ~/.config/rtv/rtv.cfg ;}
  cfg-samba() { sudo $EDITOR /etc/samba/smb.conf ;}
  cfg-skippyxd() { $EDITOR ~/.skippy-xd.rc ;}
  cfg-sourcelist() { sudo $EDITOR /etc/apt/sources.list ;}
  cfg-ssh-client() { sudo $EDITOR /etc/ssh/ssh_config ;}
  cfg-ssh-daemon() { sudo $EDITOR /etc/ssh/sshd_config ;}
  cfg-starpage() $EDITOR ~/Firefox/startpage.html
  cfg-sudoers() { sudo $EDITOR /etc/sudoers ;}
  cfg-surfraw-conf() { $EDITOR ~/.config/surfraw/conf ;}
  cfg-surfraw() { $EDITOR ~/.config/surfraw/bookmarks ;}
  cfg-synclient() { $EDITOR ~/.scripts/synclient.sh ;}
  cfg-syncthing() { $EDITOR ~/.config/syncthing/config.xml ;}
  cfg-syslinux() { sudo $EDITOR /boot/syslinux/syslinux.cfg ;}
  cfg-termite() { $EDITOR ~/.config/termite/config ;}
  cfg-tlp() { sudo $EDITOR /etc/default/tlp ;}
  cfg-tmux() { $EDITOR ~/.tmux.conf ;}
  cfg-torrentflix() { torrentflix --config=$EDITOR ;}
  cfg-tpb() { $EDITOR ~/.scripts/tpb.sh ;}
  cfg-transmission-daemon() { $EDITOR ~/.config/transmission-daemon/settings.json ;}
  cfg-transmission-ncurse() { $EDITOR ~/.config/transmission-remote-cli/settings.cfg ;}
  cfg-trz() { $EDITOR ~/.scripts/trz.sh ;}
  cfg-updatedb() { sudo $EDITOR /etc/updatedb.conf ;}
  cfg-urlview() { $EDITOR ~/.urlview ;}
  cfg-vimperatorrc() {$EDITOR ~/.vimperatorrc ;}
  cfg-vimrc() { $EDITOR ~/.config/nvim/init.vim ;}
  cfg-w3m-keymap() { $EDITOR ~/.w3m/keymap ;}
  cfg-w3m() { $EDITOR ~/.w3m/config ;}
  cfg-wegorc() { $EDITOR ~/.wegorc ;}
  cfg-xboxdrv() { sudo $EDITOR /etc/default/xboxdrv ;}
  cfg-xdg-mine() { $EDITOR ~/.local/share/applications/mimeapps.list ;}
  cfg-xinitrc() { $EDITOR ~/.xinitrc ;}
  cfg-xresources() { $EDITOR ~/.Xresources ;}
  cfg-yaourtrc() { $EDITOR ~/.yaourtrc ;}
  cfg-youtube-channels() { $EDITOR ~/.zsh/custom/youtube.zsh ;}
  cfg-youtube-viewer() { $EDITOR ~/.config/youtube-viewer/youtube-viewer.conf ;}
  cfg-zshrc() { $EDITOR ~/.zshrc ;}
  cfg-zurlrc() { $EDITOR ~/.zurlrc ;}

#   }}}

# Reload Files {{{

  alias rld-bashrc='source ~/.bashrc'
  alias rld-font='fc-cache -v -f'
  alias rld-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
  alias rld-i3='i3-msg reload'
  alias rld-screenlayout='sh ~/.screenlayout/reload_monitor.sh'
  alias rld-synclient='sh ~/.scripts/synclient.sh'
  alias rld-termite='xrdb -load ~/.config/termite/config ; clear'
  alias rld-updatedb='sudo updatedb'
  alias rld-xdefaults='xrdb ~/.Xdefaults'
  alias rld-xmodmap='xmodmap ~/.Xmodmap'
  alias rld-xresources='xrdb -load ~/.Xresources'

# }}}

# Calibre CLI v3 {{{

# DEMO: http://www.youtube.com/watch?v=FeoVsC4U_0A
# DESC: ebook manager supports many formats and devices; interfaces with cli, webui, gui
# URL:  http://manual.calibre-ebook.com/cli/calibredb.html

# define your library path
cbbook=~/MA_Calibre/Book
cbcomic=~/MA_Calibre/Comic
cbdojinshi=~/MA_Calibre/Dojinshi
cbsuper=~/MA_Calibre/Super

cmx-list() {
  if [  $# -lt 1 ]; then
        echo -e "calibredb list files of a library"
        echo -e "\nUsage:\n$0 <library>"
        echo -e "\nExample:\n$0 \$cbcomic\n"
        return 1
  fi

  calibredb list -f authors,title,tags,rating --library-path "$1"
}

cmx-search() {
  if [  $# -lt 2 ]; then
        echo -e "calibredb search files of a library"
        echo -e "\nUsage:\n$0 <library> <keywords>"
        echo -e "\nExample:\n$0 \$cbcomic marvel"
        echo -e "$0 \$cbcomic 'the walking dead'\n"
        return 1
  fi

  calibredb list -s "${@:2}" -f authors,title,tags,rating --library-path "$1"
}

cmx-add() {
  if [  $# -lt 2 ]; then
        echo -e "calibredb add new files to a library"
        echo -e "\nUsage:\n$0 <library> <file>"
        echo -e "\nExample:\n$0 \$cbcomic file.cbz"
        echo -e "$0 \$cbcomic file1.cbz file2.cbz"
  echo -e "$0 \$cbcomic file.epub file2.pdf file3.cbr\n"
        return 1
  fi

  calibredb add "${@:2}" --library-path "$1"
}

cmx-remove() {
  if [  $# -lt 2 ]; then
        echo -e "calibredb remove files from a library"
        echo -e "\nUsage:\n$0 <library> <id>"
        echo -e "$0 <library> <range>"
        echo -e "\nExample:\n$0 \$cbcomic 100"
        echo -e "$0 \$cbcomic 50-55"
        echo -e "$0 \$cbcomic 100,120-127"
        return 1
  fi

  calibredb remove "${@:2}" --library-path "$1"
}

cmx-show() {
  if [  $# -lt 2 ]; then
        echo -e "calibredb show file metadata from a library"
        echo -e "\nUsage:\n$0 <library> <id>"
        echo -e "\nExample:\n$0 \$cbcomic 16"
        return 1
  fi

  calibredb show_metadata "${@:2}" --library-path "$1" | html2text
}

cmx-recipes() { ebook-convert --list-recipes | less ;}

# WebUI content server
# http://manual.calibre-ebook.com/cli/calibre-server.html
# http://192.168.1.xxx:port
cmx-quit() { kill $(ps -ef | grep -i '[C]alibre-server' | awk '{print $2}') ;}
cmx-server() {
  # start all content server on different ports
  calibre-server -p 57770 --daemonize --with-library "$cbbook"
  calibre-server -p 57771 --daemonize --with-library "$cbcomic"
  calibre-server -p 57772 --daemonize --with-library "$cbdojinshi"
  calibre-server -p 57773 --daemonize --with-library "$cbsuper"
}

# }}}

# Other Stuff/ Fun {{{

  alias aqua='asciiquarium'
  alias arch-wiki='ranger /usr/share/doc/arch-wiki/html/en'
  alias backup-all='sudo rsync / /media/東芝/Backup/Arch/'
  alias battery='watch sudo tlp-stat -b'
  alias cfm='ranger'
  alias color='gcolor2'
  alias df='df -hT'
  alias dim='xbacklight -set 2'
  alias disk='pydf'
  alias download='you-get -o ~/vids'
  alias du='du -d1 -h | sort -h'
  alias fixtime='timedatectl set-ntp true'
  alias free='free -h'
  alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
  alias getkeycode='xev | grep keycode'
  alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
  alias hear='mplayer'
  alias links='cat ~/docs/.links'
  alias logkeys='sudo logkeys --start --output'
  alias lsblk='lsblk -o "NAME,SIZE,FSTYPE,TYPE,LABEL,MOUNTPOINT,UUID"'
  alias m='man'
  alias matrix='ncmatrix'
  alias menu='ponymenu'
  alias mkcheat='cd /usr/lib/python2.7/site-packages/cheat/cheatsheets && cl'
  alias mount='mount | column -t'
  alias myserver2='python2 -m SimpleHTTPServer'
  alias p8='ping 8.8.8.8'
  alias paclck='srm /var/lib/pacman/db.lck'
  alias paclog='vim /var/log/pacman.log'
  alias pipes='sh ~/.scripts/pipes.sh'
  alias ports='netstat --all --numeric --programs --inet --inet'
  alias rain='sh ~/.scripts/rain.sh'
  alias rmcache='srmr ~/.cache'
  alias rot13='tr a-zA-Z n-za-mN-ZA-M'
  alias rsync='rsync -ruv'
  alias share='kdeconnect-cli -d b0ffbb41b8e60f45 --share'
  alias size='clear ; du | sort -h'
  alias starwars='telnet towel.blinkenlights.nl'
  alias svim='sudo nvim'
  alias touchpad-off='synclient TouchpadOff=1'
  alias touchpad-on='synclient TouchpadOff=0'
  alias touchscreen-off='xinput disable 9'
  alias touchscreen-on='xinput enable 9'
  alias vim='nvim'
  alias watch='watch -n 1'
  alias wget='wget -c'
# alias battery='watch -dn1 acpi -ib'


# uses ip or ifconfig, good on older or newer system
    m-ip() {
        echo "--------------- Network Information ---------------"
  # show router ip
  echo "router ip:" $(netstat -rn | awk 'FNR == 3 {print $2}')
  # newer system like archlinux
  ip addr | awk '/global/ {print $1,$2}' | cut -d\/ -f1
  ip addr | awk '/global/ {print $3,$4}'
  ip addr | awk '/ether/ {print $1,$2}'
  ip addr | awk '/scope link/ {print $1,$2}' | cut -d\/ -f1
  # older system like debian
        ifconfig | awk '/inet addr/ {print $1,$2}' | awk -F: '{print $1,$2}'
        ifconfig | awk '/Bcast/ {print $3}' | awk -F: '{print $1,$2}'
        ifconfig | awk '/inet addr/ {print $4}' | awk -F: '{print $1,$2}'
        ifconfig | awk '/HWaddr/ {print $4,$5}'
        ifconfig | awk '/Scope:Link/ {print $1,$3}' | cut -d\/ -f1
  # echo External IP $(curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+")
  echo External IP: $(curl -s http://ipecho.net/plain)
        echo "---------------------------------------------------"
    }
#}}}
# -- Fasd ----------------------------------------------------------------------

# DEMO: http://www.youtube.com/watch?v=ur81Y-mV5Us
# URL:  https://github.com/clvv/fasd
# DESC: jump to path or open recent files quickly from cli, better than autojump

    if which fasd >/dev/null; then
  eval "$(fasd --init auto)"	# get fasd working, initialization code
  alias m='f -e $PLAYER'		# open with video player
  alias o='a -e $OPENER'		# open any file
  alias v='f -e $EDITOR'		# open with text editor
    fi
#}}}
# -- PulseAudio Switcher CLI v2 ------------------------------------------------

# DEMO: https://www.youtube.com/watch?v=jhv-2pNWfr4
# DESC: switch audio stream to different output (HDMI, Headphone, Speakers ...etc)
# REFF: http://askubuntu.com/a/18210

pa-global() {
  if [  $# -lt 1 ]; then
        echo -e "pulseaudio redirect audio of all running app to another device"
        echo -e "\nUsage:\n$0 <device_index_number>"
        echo -e "\nExample:\n$0 0 \n"
  echo "==============="
  echo "Sound Devices"
  pacmd list-sinks | awk '/index/ || /name:/'
        return 1
  fi

  # list all apps in playback tab (ex: cmus, mplayer, vlc)
  inputs=($(pacmd list-sink-inputs | awk '/index/ {print $2}'))
  # set the default output device
  pacmd set-default-sink $1 &> /dev/null
  # apply the changes to all running apps to use the new output device
  for i in ${inputs[*]}; do pacmd move-sink-input $i $1 &> /dev/null; done
    }
    pa-solo() {
  if [  $# -lt 2 ]; then
        echo -e "pulseaudio redirect audio of one running app to another device"
        echo -e "\nUsage:\n$0 <app_index_number> <device_index_number>"
        echo -e "\nExample:\n$0 2302 0 \n"
  echo "==============="
  echo "Running Apps"
  pacmd list-sink-inputs | awk '/index/ || /application.name /'
  echo "==============="
  echo "Sound Devices"
  pacmd list-sinks | awk '/index/ || /name:/'
        return 1
  fi

  # set the default output device
  pacmd set-default-sink "$2" &> /dev/null
  # apply changes to one running app to use the new output device
  pacmd move-sink-input "$1" "$2" &> /dev/null
}

#}}}


# -- Transmission CLI v2 -------------------------------------------------------

# DEMO: http://www.youtube.com/watch?v=ee4XzWuapsE
# DESC: lightweight torrent client; interface from cli, webui, ncurses, and gui
# WebUI:	http://localhost:9091/transmission/web/
# 		http://192.168.1.xxx:9091/transmission/web/

tsm-clearcompleted() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;}

# display numbers of ip being blocked by the blocklist (credit: smw from irc #transmission)
tsm-count() { echo "Blocklist rules:" $(curl -s --data \
  '{"method": "session-get"}' localhost:9091/transmission/rpc -H \
  "$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
  | cut -d: -f 11 | cut -d, -f1) ;}

# DEMO: http://www.youtube.com/watch?v=TyDX50_dC0M
# DESC: merge multiple ip blocklist into one
tsm-blocklist() {
  echo -e "${Red} Stopping Transmission Daemon ${Color_Off}"
  killall transmission-daemon
  echo -e "${Yellow} Updating Blocklist ${Color_Off}"
  ~/.scripts/blocklist.sh
  echo -e "${Green} Restarting Transmission Daemon ${Color_Off}"
  transmission-daemon
  sleep 3
        echo -e "${Red}--------------- Number of IP Blocking -------------${Color_Off}"
  tsm-count
}
tsm-altdownloadspeed() { transmission-remote --downlimit "${@:-900}" ;}	# download default to 900K, else enter your own
tsm-altdownloadspeedunlimited() { transmission-remote --no-downlimit ;}
tsm-limitupload() { transmission-remote --uplimit "${@:-10}" ;}	# upload default to 10kpbs, else enter your own
tsm-limituploadunlimited() { transmission-remote --no-uplimit ;}
tsm-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
tsm-daemon() { transmission-daemon ;}
tsm-quit() { killall transmission-daemon ;}
tsm-add() { transmission-remote --add "$1" ;}
tsm-pause() { transmission-remote -t"$1" --stop ;}		# <id> or all
tsm-start() { transmission-remote -t"$1" --start ;}		# <id> or all
tsm-purge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tsm-remove() { transmission-remote -t"$1" --remove ;}		# leaves data alone
tsm-info() { transmission-remote -t"$1" --info ;}
tsm-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}
tsm-grep() { transmission-remote --list | grep -i "$1" ;}
tsm() { transmission-remote --list ;}

# DEMO: http://www.youtube.com/watch?v=hLz7ditUwY8
# URL:  https://github.com/fagga/transmission-remote-cli
# DESC: ncurses frontend to transmission-daemon
tsm-ncurse() { transmission-remote-cli ;}

#}}}
# -- Ubooquity Ebook Comicbook Server ------------------------------------------

# DEMO: https://www.youtube.com/watch?v=qfLG9nKt3ew
# URL:  http://vaemendis.net/ubooquity/
# DESC: personal comic and ebook server

PATH_UBOOQUITY=~/.ubooquity
ubooquity() { cd $PATH_UBOOQUITY && nohup java -jar $PATH_UBOOQUITY/Ubooquity.jar -webadmin -headless >/dev/null 2>&1& }
ubooquity-gui() { cd $PATH_UBOOQUITY && nohup java -jar $PATH_UBOOQUITY/Ubooquity.jar -webadmin >/dev/null 2>&1& }
ubooquity-quit() { kill $(ps -ef | grep '[U]booquity.jar' | awk '{print $2}') ;}
ubooquity-status() {
  if ps -ef | grep '[U]booquity.jar' > /dev/null
  then
    echo "Ubooquity is running on http://localhost:2202"
    echo "To change settings use http://localhost:2202/admin"
  else
    echo "Ubooquity has stopped"
  fi
}

# }}}
# -- Convert to Audio ----------------------------------------------------------

# https://trac.ffmpeg.org/wiki/Encode/MP3
# https://trac.ffmpeg.org/wiki/Encode/AAC
# https://trac.ffmpeg.org/wiki/TheoraVorbisEncodingGuide

convert2audio_mp3() {
    if [  $# -lt 1 ]; then
        echo -e "Usage: $0 <file_name>"
        echo -e "\nsingle:   $0 file.m4a"
        echo -e "\nmultiple: $0 file1.m4a file2.m4a file3.m4a"
        echo -e "\nwildcard: $0 *.m4a"
        return 1
    fi

    myArray=( "$@" )
    for arg in "${myArray[@]}"; do
    while [ ! -f "${arg%.*}"-audiotrack.mp3 ]
    do
        ffmpeg -i "$arg" -codec:a libmp3lame -qscale:a 2 "${arg%.*}"-audiotrack.mp3
        done
    done
}

convert2audio_m4a() {
    if [  $# -lt 1 ]; then
        echo -e "Usage: $0 <file_name>"
        echo -e "\nsingle:   $0 file.mp3"
        echo -e "\nmultiple: $0 file1.mp3 file2.mp3 file3.mp3"
        echo -e "\nwildcard: $0 *.mp3"
        return 1
    fi

    myArray=( "$@" )
    for arg in "${myArray[@]}"; do
        while [ ! -f "${arg%.*}"-audiotrack.m4a ]
        do
            ffmpeg -i "$arg" -codec:a aac -qscale:a 6 -strict experimental "${arg%.*}"-audiotrack.m4a
        done
    done
}
convert2audio_ogg() {
    if [  $# -lt 1 ]; then
        echo -e "Usage: $0 <file_name>"
        echo -e "\nsingle:   $0 file.mp3"
        echo -e "\nmultiple: $0 file1.mp3 file2.mp3 file3.mp3"
        echo -e "\nwildcard: $0 *.mp3"
        return 1
    fi

    myArray=( "$@" )
    for arg in "${myArray[@]}"; do
        while [ ! -f "${arg%.*}"-audiotrack.ogg ]
        do
            ffmpeg -i "$arg" -codec:a libvorbis -qscale:a 5 -vn "${arg%.*}"-audiotrack.ogg
        done
    done
}

convert2audio_wav() {
    if [  $# -lt 1 ]; then
        echo -e "Usage: $0 <file_name>"
        echo -e "\nsingle:   $0 file.mp3"
        echo -e "\nmultiple: $0 file1.mp3 file2.mp3 file3.mp3"
        echo -e "\nwildcard: $0 *.mp3"
        return 1
    fi

    myArray=( "$@" )
    for arg in "${myArray[@]}"; do
        while [ ! -f "${arg%.*}"-audiotrack.wav ]
        do
            ffmpeg -i "$arg" "${arg%.*}"-audiotrack.wav
        done
    done
}

convert2audio_webm() {
    if [  $# -lt 1 ]; then
        echo -e "Usage: $0 <file_name>"
        echo -e "\nsingle:   $0 file.mp3"
        echo -e "\nmultiple: $0 file1.mp3 file2.mp3 file3.mp3"
        echo -e "\nwildcard: $0 *.mp3"
        return 1
    fi

    myArray=( "$@" )
    for arg in "${myArray[@]}"; do
        while [ ! -f "${arg%.*}"-audiotrack.webm ]
        do
            ffmpeg -i "$arg" -codec:a libvorbis -qscale:a 5 -vn "${arg%.*}"-audiotrack.webm
        done
    done
}

convert2audio_wavmono() {
    if [  $# -lt 1 ]; then
        echo -e "Usage: $0 <file_name>"
        echo -e "\nsingle:   $0 file.mp3"
        echo -e "\nmultiple: $0 file1.mp3 file2.mp3 file3.mp3"
        echo -e "\nwildcard: $0 *.mp3"
        return 1
    fi

    myArray=( "$@" )
    for arg in "${myArray[@]}"; do
        while [ ! -f "${arg%.*}"-monoaudiotrack.wav ]
        do
            ffmpeg -i "$arg" -codec:a pcm_mulaw -ar 8000 -ac 1 "${arg%.*}"-monoaudiotrack.wav
        done
    done
}

convert2audio_wma() {
if [  $# -lt 1 ]; then
    echo -e "Usage: $0 <file_name>"
    echo -e "\nsingle:   $0 file.mp3"
    echo -e "\nmultiple: $0 file1.mp3 file2.mp3 file3.mp3"
    echo -e "\nwildcard: $0 *.mp3"
    return 1
fi

    myArray=( "$@" )
    for arg in "${myArray[@]}"; do
        while [ ! -f "${arg%.*}"-audiotrack.wma ]
        do
            ffmpeg -i "$arg" -codec:a wmav2 -b:a 128k "${arg%.*}"-audiotrack.wma
        done
    done
}

# -- Simple HTTP Server --------------------------------------------------------
# DESC: python http server, host files and folders

SimpleHTTPserver() {
    if which python2 >/dev/null; then
        python2 -m SimpleHTTPServer "${1:-8000}"
    else
        python3 -m http.server "${1:-8000}"
    fi
}
#}}}

###############################################################################
# Functions
###############################################################################

# For some reason, bigger git directories were loading slowly.
# This somehow speeds it up:
function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Send a file to print at Mugar with "mugar_print file.pdf"
function mugar_print() {
  cat $1 | ssh walshcb@scc-lite.bu.edu lpr -P mugar-ds-staple -J 'print-job'
}

# Send a script with qsub with "qsub_job myscript.R"
function qsub_job() {
  jobname=$(basename $1)
  qsub -P econdept -cwd -m beas -N $jobname $1
}

# Same as above but for parallel jobs:
function qsub_parallel_job() {
  jobname=$(basename $1)
  qsub -P econdept -pe omp 12 -cwd -m beas -N $jobname $1
}

function weather() {
  curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml"
}

function calc() {
  R --vanilla --slave -e $1
}

function texToHTML() {
  htlatex $1 "ht5mjlatex.cfg, charset=utf-8" " -cunihtf -utf8"
}

function extract() {
        if [ -f $1 ]; then
                case $1 in
                        *.tar.bz2)   tar xvjf $1     ;;
                        *.tar.gz)    tar xvzf $1     ;;
                        *.bz2)       bunzip2 $1      ;;
                        *.rar)       unrar x $1      ;;
                        *.gz)        gunzip $1       ;;
                        *.tar)       tar xvf $1      ;;
                        *.tbz2)      tar xvjf $1     ;;
                        *.tgz)       tar xvzf $1     ;;
                        *.zip)       unzip $1        ;;
                        *.Z)         uncompress $1   ;;
                        *.7z)        7z x $1         ;;
                        *)           echo "'$1' cannot be extracted via >extract<" ;;
                esac
        else
                echo "'$1' is not a valid file!"
        fi
}


# }}}
