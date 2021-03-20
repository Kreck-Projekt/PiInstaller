#!/usr/bin/bash

# prints colored text
print_style () {

    if [ "$2" == "info" ] ; then
        COLOR="96m";
    elif [ "$2" == "success" ] ; then
        COLOR="92m";
    elif [ "$2" == "warning" ] ; then
        COLOR="93m";
    else #default color
        COLOR="0m";
    fi

    STARTCOLOR="\e[$COLOR";
    ENDCOLOR="\e[0m";

    printf "$STARTCOLOR%b$ENDCOLOR" "$1";
}

print_style "installing dependencies\n" "info";
sudo apt-get install openjdk-8-jdk -y & sudo apt-get install wiringpi -y & sudo apt-get install screen -y & sudo apt-get install git -y
sleep 2
print_style "Installing RaspiOpener and AliveKeeper\n" "info";
mkdir opener
cd opener
wget https://github.com/Kreck-Projekt/RaspiOpener/releases/download/1.0/RaspiOpener.jar
sleep 2
wget https://github.com/Kreck-Projekt/AliveKeeper/releases/download/1.0/AliveKeeper.jar
sleep 2
print_style "modify executable\n" "info";
sudo chmod -755 AliveKeeper.jar
sudo chmod -755 RaspiOpener.jar
print_style "Warning: A reboot is recommended." "warning";
print_style "Warning: After a reboot you must redo the step below, you can avoid this by adding the AliveKeeper to the autostart\n" "warning";
print_style "now open a new screen with 'screen -S opener' and start the AliveKeeper 'sudo java -jar AliveKeeper.jar'\n" "success";
