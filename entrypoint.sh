#!/bin/bash

# Download linux serverfiles for Call of Duty 4
if [ ! -d "/gameserver/main/" ]; then
    echo "---| Download Serverfiles for Call of Duty 4"
    echo "---| This can take some minutes so be patient"
    cd /gameserver
    if wget -nv --show-progress --progress=bar:force:noscroll "https://dl.forgotten-games.net/cod/cod4_lnxded.tar.gz" ; then
                 echo "---| Successfully downloaded, now extracting |---"
         tar xzvf cod4_lnxded.tar.gz -C /gameserver/
         rm cod4_lnxded.tar.gz
         echo "---| Download finished |---"
            else
                 echo "---| Can't download 'cod4_lnxded.tar.gz', putting server into sleep mode... |---"
         sleep infinity
        fi
fi

# Start a Vanilla Call of Duty 4 Server
if [ "${COD_GAME}" == "nomod" ]; then
      if [ ! -f "/config/default/server.cfg" ]; then
          echo "---|  No 'server.cfg' for Call of Duty 4 found, copying default server.cfg"
          mkdir /config/default
          cp /opt/config/server.cfg /config/default/server.cfg
          echo "---|  Change 'server.cfg to your needs and restart the container"
          sleep infinity
        else
          echo "---| Call of Duty config 'server.cfg' found, continuing"
          echo "---| Start Call of Duty Server 4 with Version ${COD_VERSION}"
          cd /gameserver/
          ./cod4_lnxded_${COD_VERSION} +set fs_basepath /gameserver ${STARTUP}
      fi
fi

# Start a Modded Call of Duty Server
if [ "${COD_GAME}" == "mod" ]; then
     echo "---| Please be sure you upload all needed mod files and create the configs."
     echo "---| Change the Startup ENV to your mods's needings."
     echo "---| Server will start in 3 Seconds."
     cd /gameserver/
     ./cod4_lnxded_${COD_VERSION} +set fs_basepath /gameserver ${STARTUP}
fi