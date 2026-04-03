FROM archlinux:latest

#Variables for installation

#Install dependencies
RUN pacman -Syu --noconfirm \
    mono \
    lua \
    unzip \
    git \
    wget \
    base-devel \
    sdl2 \
    sdl2_image \
    sdl2_ttf \
    sdl2_sound \
    openal \
    libcanberra \
    mesa \
    xorg-xhost \
    xorg-xauth \
    xorg-xrandr \
    jre-openjdk \
    && pacman -Scc --noconfirm


# Install font
COPY ["Franklin Gothic Medium Regular.ttf", "/usr/share/fonts/truetype/"]
RUN fc-cache -fv


# Download BizHawk & Ironmon-Tracker & Randomizer
WORKDIR /opt/BizHawk
RUN curl -sL https://github.com/TASEmulators/BizHawk/releases/download/2.11/BizHawk-2.11-linux-x64.tar.gz | tar xz

# Install tracker
RUN wget -qO tracker.zip https://github.com/besteon/Ironmon-Tracker/releases/download/v9.2.3/Ironmon-Tracker.zip && \
    unzip tracker.zip -d Lua && rm tracker.zip

# Install PixelFont extension
RUN wget -qO Lua/Ironmon-Tracker/Extensions/PixelFont.lua \
    https://github.com/Leopardly/PixelFontExtension/releases/download/1.4/PixelFont.lua

# Install Randomizer
RUN wget -qO upr.zip https://github.com/Ajarmar/universal-pokemon-randomizer-zx/releases/download/v4.6.1/PokeRandoZX-v4_6_1.zip && \
    unzip upr.zip PokeRandoZX.jar -d Lua/Ironmon-Tracker && rm upr.zip

RUN chmod -R 777 /opt/BizHawk
ENV PATH="$PATH:$JAVA_HOME/bin"
