# This script assumes you have docker installed and will download the frostvoid/mumble
# image from docker hub, create a volume, start the container and set up murmur (mumble server).

# IMPORTANT!
# Edit these 3 lines with your server/SuperUser password and MOTD (message shown to users when logging in)
SERVERPASS="kf92IXoywOY3HdfALuOKmvTEH"
ADMINPASS="gS2ICaf5oiTf1Ae0esCSUGWVQ"
MOTD="<br/>First line of message<br/>Second Line"

# Optionally alter these if you want, but these defaults should be good for most uses
CONTAINERNAME="mumble"
VOLUMENAME="mumble-data"
RESTARTPOLICY="--restart=always"

docker pull frostvoid/mumble
docker volume create $VOLUMENAME
docker run -d -p 64738:64738 -p 64738:64738/udp -v $VOLUMENAME:/data --name=$CONTAINERNAME $RESTARTPOLICY -e "SERVER_PASSWORD=$SERVERPASS" -e "SUPW=$ADMINPASS" -e "SERVER_TEXT=$MOTD" frostvoid/mumble
