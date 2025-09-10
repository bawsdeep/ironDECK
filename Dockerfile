FROM eclipse-temurin:8-jre-noble

#Variables for installation
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV XKB_DEFAULT_RULES=base

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    unzip \
    dbus-x11 \
    libxv1 \
    libglu1-mesa \
    xauth \
    x11-utils \
    x11-xkb-utils \
    libgtk2.0-0 \
    libopenal1 \
    wget \
    curl \
    git \
    mono-complete
    && rm -rf /var/lib/apt/lists/* && apt-get clean
# Install font
COPY ["Franklin Gothic Medium Regular.ttf", "/usr/share/fonts/truetype/"]
RUN fc-cache -fv

# Download Bizhawk & Ironmon-Tracker & Randomizer
WORKDIR /opt/BizHawk
RUN curl -sL https://github.com/TASEmulators/BizHawk/releases/download/2.10/BizHawk-2.10-linux-x64.tar.gz | tar xz
RUN git clone -b external https://github.com/champred/Ironmon-Tracker.git Lua/Ironmon-Tracker
RUN wget -qO upr.zip https://github.com/Ajarmar/universal-pokemon-randomizer-zx/releases/download/v4.6.1/PokeRandoZX-v4_6_1.zip && \
    unzip upr.zip PokeRandoZX.jar -d Lua/Ironmon-Tracker && rm upr.zip
RUN chmod -R 777 /opt/BizHawk
ENV PATH="$PATH:$JAVA_HOME/bin"
