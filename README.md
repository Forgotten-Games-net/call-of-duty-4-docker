# Call of Duty 4 Docker Image!

Here you get a Docker Image for the Game Call of Duty 4. You can host easily multiple gameserver instances with one gamedir! 

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/keinnerd/cod4docker?style=flat-square) ![Docker Pulls](https://img.shields.io/docker/pulls/keinnerd/cod4docker?style=flat-square)

## 📦 What you get
 - Well documented Game Configurations
 - Multiple Versions (`1.7`, `1.8x`)
 - Multiple Server with one install
 - Download latest Serverfiles
 - [COD4x Support](https://github.com/callofduty4x/CoD4x_Server) included 
 - Easy Mod Support

## 🚀 How to start
For a fast start simply 
```
    docker create \
      --name cod4docker \
      -p 28960:28960 \
      -p 28960:28960/udp \
      -v <your/path/to/game/>:/gameserver \
      -v <your/path/to/game/>:/config \
      -e COD_VERSION="1_7" \
      -e COD_GAME="main" \
      -e STARTUP="+set fs_homepath config/server1 +set fs_savepath config/server1 +set dedicated 2 +set net_ip 0.0.0.0 +set net_port "28960" +exec server.cfg +map_rotate" \
    keinnerd/cod4docker:latest
```

## 🔧 Envs

|Env             |Options                       |Description                         |
|----------------|-------------------------------|-----------------------------|
|COD_VERSION     | Basic: `1_7` or `1_8` | Choose your Game Version|
|COD_GAME        | `nomod` or `mod` |`nomod` = Call of Duty 4 Vanilla / `mod` = Call of Duty 4 with Mod Options|
|STARTUP         | "`+set fs_homepath config/server1 +set fs_savepath config/server1 +set dedicated 2 +set net_ip 0.0.0.0 +set net_port "28960" +exec server.cfg +map_rotate`" | Adjust your Start command (fs_basepath is hardcoded to /gameserver)

Hint: if you use the `mod` ENV you must adjust the Startup Comand and have to add `+set fs_game mods/yourmod`

## 📁 Multiple Servers

If you want to host multiple servers, create a new container then create inside your config folder different dirs and change `+set fs_homepath config/` to `config/server1` the next to `config/server1`. Create Configs inside the dirs and spin up the container. 

```
── /config
 ├──> server1 (e.g call of duty 4 ranked)
 ├──────> main/server.cfg
 ├──> server2 (e.g call of duty 4 unranked)
 ├──────> main/server.cfg
 ├──> server3 (e.g Modded Server)
 └──────> main/server.cfg & yourmod/mod.cfg or mod.cfg
```

Open needed Ports in your firewall! Default Ports: 28960/tcp 28960/udp

## 👾 Mods

If you want to play a Modification you need to upload your mod in the `gamedir` and adjust some ENV's

- Change `COD_GAME` to `mod`
- Change `COD_VERSION` to your needed Version
- Change `STARTUP` to ` +set fs_game mods/YOURMOD +set fs_homepath config/YOURMOD/ +set dedicated 2 +set net_ip 0.0.0.0 +set net_port "28960" +exec YOURMOD.cfg +map_rotate`


## 📝 ToDo

- nothing today

## 👐 Contribution

Feel free to fork and make pull requests. This are my first attempts with creating docker images so please give me feedback. 
