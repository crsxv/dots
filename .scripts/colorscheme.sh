#!/bin/bash
# Original: http://frexx.de/xterm-256-notes/
#           http://frexx.de/xterm-256-notes/data/colortable16.sh
# Modified by Aaron Griffin
# and further by Kazuo Teramoto
# even further modifications by leofa
# added various cool scripts i found on git (thanks Scott Garett for archlogo)

usage() {
  echo "
  # \O_o/
  colortheme:
  organized color-scripts into one
  - these are typically used to show terminal colors and \o/
  ---------------------"
  echo "     -a: arches"
  echo "     -c: colors"
  echo "     -i: invaders"
  echo "     -l: archlogo"
  echo "    -la: list all"
  echo "     -p: pacman"
  echo "     -t: tux"
  echo "     -h: this
  "
}

initializeANSI()
{
 esc="$(echo -en '\e')"

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"

  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

colors() {
  FGNAMES=(' black ' '  red  ' ' green ' ' yellow' '  blue ' 'magenta' '  cyan ' ' white ')
  BGNAMES=('DFT' 'BLK' 'RED' 'GRN' 'YEL' 'BLU' 'MAG' 'CYN' 'WHT')
  echo "     ┌──────────────────────────────────────────────────────────────────────────┐"
  for b in $(seq 0 8); do
      if [ "$b" -gt 0 ]; then
        bg=$(($b+39))
      fi

      echo -en "\033[0m ${BGNAMES[$b]} │ "
      for f in $(seq 0 7); do
        echo -en "\033[${bg}m\033[$(($f+30))m ${FGNAMES[$f]} "
      done
      echo -en "\033[0m │"

      echo -en "\033[0m\n\033[0m     │ "
      for f in $(seq 0 7); do
        echo -en "\033[${bg}m\033[1;$(($f+30))m ${FGNAMES[$f]} "
      done
      echo -en "\033[0m │"
    echo -e "\033[0m"

    if [ "$b" -lt 8 ]; then
      echo "     ├──────────────────────────────────────────────────────────────────────────┤"
    fi
  done
  echo "     └──────────────────────────────────────────────────────────────────────────┘"
}

invaders() {
  f=3 b=4
  for j in f b; do
    for i in {0..7}; do
      printf -v $j$i %b "\e[${!j}${i}m"
    done
  done
  bld=$'\e[1m'
  rst=$'\e[0m'

  cat << EOF

 $f1  ▀▄   ▄▀     $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4  ▀▄   ▄▀     $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $f1 ▄█▀███▀█▄    $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4 ▄█▀███▀█▄    $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $f1█▀███████▀█   $f2▀▀███▀▀███▀▀   $f3▀█▀██▀█▀   $f4█▀███████▀█   $f5▀▀███▀▀███▀▀   $f6▀█▀██▀█▀$rst
 $f1▀ ▀▄▄ ▄▄▀ ▀   $f2 ▀█▄ ▀▀ ▄█▀    $f3▀▄    ▄▀   $f4▀ ▀▄▄ ▄▄▀ ▀   $f5 ▀█▄ ▀▀ ▄█▀    $f6▀▄    ▄▀$rst

 $bld$f1▄ ▀▄   ▄▀ ▄   $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4▄ ▀▄   ▄▀ ▄   $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $bld$f1█▄█▀███▀█▄█   $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4█▄█▀███▀█▄█   $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $bld$f1▀█████████▀   $f2▀▀▀██▀▀██▀▀▀   $f3▀▀█▀▀█▀▀   $f4▀█████████▀   $f5▀▀▀██▀▀██▀▀▀   $f6▀▀█▀▀█▀▀$rst
 $bld$f1 ▄▀     ▀▄    $f2▄▄▀▀ ▀▀ ▀▀▄▄   $f3▄▀▄▀▀▄▀▄   $f4 ▄▀     ▀▄    $f5▄▄▀▀ ▀▀ ▀▀▄▄   $f6▄▀▄▀▀▄▀▄$rst

                                     $f7▌$rst

                                   $f7▌$rst

                              $f7    ▄█▄    $rst
                              $f7▄█████████▄$rst
                              $f7▀▀▀▀▀▀▀▀▀▀▀$rst

EOF
}

pacman() {
	f=3 b=4
	for j in f b; do
	  for i in {0..7}; do
	    printf -v $j$i %b "\e[${!j}${i}m"
	  done
	done
	bld=$'\e[1m'
	rst=$'\e[0m'
	inv=$'\e[7m'

  cat << EOF

$rst
 $f3  ▄███████▄                $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄    $f5  ▄██████▄    $f6  ▄██████▄
 $f3▄█████████▀▀               $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7███$f2██$f7███$f2█▄  $f4▄█$f7███$f4██$f7███$f4█▄  $f5▄█$f7███$f5██$f7███$f5█▄  $f6▄██$f7█▀█$f6██$f7█▀█$f6▄
 $f3███████▀      $f7▄▄  ▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7█ █$f2██$f7█ █$f2██  $f4██$f7█ █$f4██$f7█ █$f4██  $f5██$f7█ █$f5██$f7█ █$f5██  $f6███$f7█▄▄$f6██$f7█▄▄$f6█
 $f3███████▄      $f7▀▀  ▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████  $f5████████████  $f6████████████
 $f3▀█████████▄▄               $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██  $f5██▀██▀▀██▀██  $f6██▀██▀▀██▀██
 $f3  ▀███████▀                $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀  $f5▀   ▀  ▀   ▀  $f6▀   ▀  ▀   ▀
$bld
 $f3  ▄███████▄                $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄    $f5  ▄██████▄    $f6  ▄██████▄
 $f3▄█████████▀▀               $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7█ █$f2██$f7█ █$f2█▄  $f4▄█$f7█ █$f4██$f7█ █$f4█▄  $f5▄█$f7█ █$f5██$f7█ █$f5█▄  $f6▄██$f7█▀█$f6██$f7█▀█$f6▄
 $f3███████▀      $f7▄▄  ▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7███$f2██$f7███$f2██  $f4██$f7███$f4██$f7███$f4██  $f5██$f7███$f5██$f7███$f5██  $f6███$f7█▄▄$f6██$f7█▄▄$f6█
 $f3███████▄      $f7▀▀  ▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████  $f5████████████  $f6████████████
 $f3▀█████████▄▄               $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██  $f5██▀██▀▀██▀██  $f6██▀██▀▀██▀██
 $f3  ▀███████▀                $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀  $f5▀   ▀  ▀   ▀  $f6▀   ▀  ▀   ▀
$rst

EOF
}

arches() {
initializeANSI()
{
  esc=""

  redf="${esc}[31m";     greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";
  cyanf="${esc}[36m";    purplef="${esc}[35m"

  boldon="${esc}[1m";
  reset="${esc}[0m"
}

initializeANSI

cat << EOF

${boldon}${redf}        ■      ${boldon}${greenf}        ■      ${boldon}${yellowf}        ■     ${boldon}${bluef}         ■       ${boldon}${purplef}       ■      ${boldon}${cyanf}        ■   ${reset}
${boldon}${redf}       ■■■     ${boldon}${greenf}       ■■■     ${boldon}${yellowf}       ■■■    ${boldon}${bluef}        ■■■      ${boldon}${purplef}      ■■■     ${boldon}${cyanf}       ■■■  ${reset}
${boldon}${redf}      ■■■■■    ${boldon}${greenf}      ■■■■■    ${boldon}${yellowf}      ■■■■■   ${boldon}${bluef}       ■■■■■     ${boldon}${purplef}     ■■■■■    ${boldon}${cyanf}      ■■■■■ ${reset}
${redf}     ■(   )■   ${greenf}     ■(   )■   ${yellowf}     ■(   )■   ${bluef}     ■(   )■    ${purplef}    ■(   )■   ${cyanf}     ■(   )■   ${reset}
${redf}    ■■■■ ■■■■  ${greenf}    ■■■■ ■■■■  ${yellowf}    ■■■■ ■■■■  ${bluef}    ■■■■ ■■■■   ${purplef}   ■■■■ ■■■■  ${cyanf}    ■■■■ ■■■■  ${reset}
${redf}   ■■       ■■ ${greenf}   ■■       ■■ ${yellowf}   ■■       ■■ ${bluef}   ■■       ■■  ${purplef}  ■■       ■■ ${cyanf}   ■■       ■■ ${reset}

EOF
}

archlogo() {

L="$(tput sgr0; tput setaf 0)"
LB="$(tput sgr0; tput setab 0)"
l="$(tput bold ; tput setaf 0)"
w="$(tput sgr0; tput setaf 7)"
WB="$(tput sgr0; tput setab 7)"
W="$(tput bold ; tput setaf 7)"
R="$(tput sgr0; tput setaf 1)"
RB="$(tput sgr0; tput setab 1)"
r="$(tput bold ; tput setaf 1)"
G="$(tput sgr0; tput setaf 2)"
GB="$(tput sgr0; tput setab 2)"
g="$(tput bold ; tput setaf 2)"
Y="$(tput sgr0; tput setaf 3)"
YB="$(tput sgr0; tput setab 3)"
y="$(tput bold ; tput setaf 3)"
B="$(tput sgr0; tput setaf 4)"
BB="$(tput sgr0; tput setab 4)"
b="$(tput bold ; tput setaf 4)"
P="$(tput sgr0; tput setaf 5)"
PB="$(tput sgr0; tput setab 5)"
p="$(tput bold ; tput setaf 5)"
C="$(tput sgr0; tput setaf 6)"
CB="$(tput sgr0; tput setab 6)"
c="$(tput bold ; tput setaf 6)"
N="$(tput sgr0)"

echo "$WB                                                                                "
echo " $N                                                                              $WB "
echo " $N           $CB $N            $WB                                                     $N $WB "
echo " $N          $CB   $N           $WB $N$CB                                                   $WB $N $WB "
echo " $N         $CB     $N          $WB $N$CB                                                   $WB $N $WB "
echo " $N        $CB       $N         $WB $N$CB    $N  $CB  $N    $CB  $N    $CB $N $CB  $N $CB  $WB $CB    $WB $CB $WB $CB   $WB $CB $WB $CB  $WB $CB $WB $CB   $WB $CB   $WB $N $WB "
echo " $N       $CB         $N        $WB $N$CB   $N $CB  $N $CB $N $CB   $N $CB $N $CB    $N $CB  $N $CB  $WB $CB    $WB $CB $WB $WB $CB  $WB $CB $WB $CB  $WB $CB  $WB $CB $WB $CB    $WB $N $WB "
echo " $N      $CB           $N       $WB $N$CB   $N    $CB $N    $CB  $N $CB    $N    $CB  $WB $CB    $WB $CB $WB $CB $WB $CB $WB $CB $WB $CB  $WB $CB   $WB $CB     $WB $N $WB "
echo " $N     $CB     $N   $CB     $N      $WB $N$CB   $N $CB  $N $CB $N $CB   $N $CB $N $CB    $N $CB  $N $CB  $WB $CB    $WB $CB $WB $CB  $WB $WB $CB $WB $CB  $WB $CB  $WB $CB $WB $CB    $WB $N $WB "
echo " $N    $CB     $N     $CB     $N     $WB $N$CB   $N $CB  $N $CB $N $CB   $N $CB $N    $CB $N $CB  $N $CB  $WB $WB $WB $WB $CB $WB $CB $WB $CB   $WB $CB  $WB $WB $CB  $WB $CB   $WB $CB   $WB $N $WB "
echo " $N   $CB      $N     $CB      $N    $WB $N$CB                                                   $WB $N $WB "
echo " $N  $CB        $N   $CB        $N   $WB $N$CB                                                   $WB $N $WB "
echo " $N $CB   $N               $CB   $N  $WB                                                     $N $WB "
echo " $N                                                                              $WB "
echo "                                                                                $N"
echo
}

tux() {
initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"

  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

initializeANSI

tuxbg=${cyanb}     # color behind tux
tuxfg=${blackf}     # tux line color

cat << EOF

${tuxfg}${tuxbg}

                      ▄█████▄
                     █████████
                    ${whiteb}████████▀██${tuxbg}
                   ${whiteb}██████████▄██${tuxbg}
                   ${whiteb}██▀▀███▀▀████${tuxbg}
                   ${whiteb}████ █ ██ ███${tuxbg}
                   ${yellowb}█         ████${tuxbg}
                   ${yellowb}█       ▄ ████${tuxbg}
                   ${yellowb}███▀▀▀▀▀▄${whiteb}▀████${tuxbg}
                   ${whiteb}██▀▀▀▀▀▀   ███${tuxbg}▄
                 ▄█${whiteb}▀          █████${tuxbg}
                ${whiteb}███           ██████${tuxbg}
               ${whiteb}███             ██████${tuxbg}
              ${whiteb}█▀██              ██████${tuxbg}
              ${whiteb}█ █               █ ████${tuxbg}
              ${whiteb}█ █               ██ ███${tuxbg}
             ${whiteb}██ ▀               █▀ ████${tuxbg}
             ${whiteb}███                   ████${tuxbg}
            ${whiteb}█████               ███ ███${tuxbg}
            ${yellowb}█▀▀███${whiteb}             █████████${tuxbg}
           ▄${yellowb}█   ███${whiteb}           █${yellowb}▀ ████  ▀█${tuxbg}
         ▄█${yellowb}▀     ████${whiteb}         █${yellowb}   ▀     █${tuxbg}
        █${yellowb}         ████${whiteb}     █  █${yellowb}         ██${tuxbg}
         █${yellowb}         ██${whiteb}       █ █${yellowb}          ▀█${tuxbg}
        █${yellowb}           █${whiteb}      █  █${yellowb}          █${tuxbg}
        █${yellowb}           ███████████${yellowb}        ▄${tuxbg}▀
         █${yellowb}▄         █${tuxbg} ▀▀▀▀▀▀▀ █${yellowb}      ▄${tuxbg}▀
           ▀▀▀▀▀${yellowb}▄▄▄█${tuxbg}▀         ▀${yellowb}▄    █${tuxbg}
                                ▀▀▀▀${tuxbg}
${reset}
EOF
}

case $1 in
  -c) colors ;;
  -i) invaders ;;
  -p) pacman ;;
  -a) arches ;;
  -t) tux ;;
  -l) archlogo ;;
  -la)
      archlogo
      tux
      colors
      invaders
      pacman
      arches ;;
  -h) usage ;;
  *) colors ;;
esac
