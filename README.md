# ironDECK

This guide is designed with Steam Deck in mind, but can work on any Linux system.

0. Install [Podman](https://github.com/89luca89/distrobox/blob/main/docs/posts/install_podman_static.md) and [Distrobox](https://github.com/89luca89/distrobox/blob/main/docs/README.md#alternative-methods)
   > These applications are already installed by default on SteamOS 3.5+
1. Update your Distrobox config to enable graphical applications
   ```bash
   echo 'xhost +si:localuser:$USER >/dev/null' > ~/.distroboxrc
   ```
2. Create a new container from the hosted Docker image, then enter it
   ```bash
   distrobox create --image ghcr.io/champred/irondeck:master <container-name>
   distrobox enter <container-name>
   ```
3. Inside the container you can then run BizHawk with the ironMON tracker
   ```bash
   cd /opt/BizHawk
   ./EmuHawkMono.sh --lua Lua/Ironmon-Tracker/Ironmon-Tracker.lua
   ```
4. Optionally you can also export the script to your desktop
   ```bash
   distrobox-export --bin /opt/BizHawk/EmuHawkMono.sh --export-path /home/deck/Desktop \
                    --extra-flags "--lua /opt/BizHawk/Lua/Ironmon-Tracker/Ironmon-Tracker.lua"
   ```
   Now you can setup the tracker and begin playing!
