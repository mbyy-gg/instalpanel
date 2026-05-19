#!/bin/bash
# ============================================================
# SKRIP INI DIBUAT OLEH ALBY OFFICIAL
# TELEGRAM: @albyy0x
# DISARANKAN GAK USAH NYOLONG!
# LEBIH BAIK LANGSUNG PAKE AJA, KALO EROR BIAR GW (ALBY) YANG BENERINNYA, LU TINGGAL LAPOR AJA KE TELEGRAM.
# ============================================================

# Reset
NC='\033[0m'

# Style
BOLD='\033[1m'
DIM='\033[2m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
HIDDEN='\033[8m'

# Foreground (Text Color Normal)
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Foreground (Text Color Bright/Bold)
BRIGHT_BLACK='\033[90m'
BRIGHT_RED='\033[91m'
BRIGHT_GREEN='\033[92m'
BRIGHT_YELLOW='\033[93m'
BRIGHT_BLUE='\033[94m'
BRIGHT_MAGENTA='\033[95m'
BRIGHT_CYAN='\033[96m'
BRIGHT_WHITE='\033[97m'

# Background Colors (Normal)
BG_BLACK='\033[40m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_MAGENTA='\033[45m'
BG_CYAN='\033[46m'
BG_WHITE='\033[47m'

# Background Colors (Bright)
BG_BRIGHT_BLACK='\033[100m'
BG_BRIGHT_RED='\033[101m'
BG_BRIGHT_GREEN='\033[102m'
BG_BRIGHT_YELLOW='\033[103m'
BG_BRIGHT_BLUE='\033[104m'
BG_BRIGHT_MAGENTA='\033[105m'
BG_BRIGHT_CYAN='\033[106m'
BG_BRIGHT_WHITE='\033[107m'

print_info() {
  echo -e "\n  ${BG_BLUE}${BRIGHT_WHITE}${BOLD} INFO ${NC} ${BOLD}$1${NC}\n"
}

print_success() {
  echo -e "\n  ${BG_GREEN}${BRIGHT_WHITE}${BOLD} SUCCESS ${NC} ${BOLD}$1${NC}\n"
}

print_warning() {
  echo -e "\n  ${BG_YELLOW}${BRIGHT_WHITE}${BOLD} WARNING ${NC} ${BOLD}$1${NC}\n"
}

print_error() {
  echo -e "\n  ${BG_RED}${BRIGHT_WHITE}${BOLD} ERROR ${NC} ${BOLD}$1${NC}\n"
}

log_info() {
  echo -e "${BOLD}${CYAN}$1${NC}"
}

log_success() {
  echo -e "${BOLD}${GREEN}$1${NC}"
}

log_error() {
  echo -e "${BOLD}${RED}$1${NC}"
}

start_script() {
  clear
  echo -e ""
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]                AUTO INSTALLER THEME             [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]                  © ALBY OFFICIAL                [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "Script ini dibuat untuk mempermudah penginstalasian tema pterodactyl."
  echo -e "Mengalami eror? Lapor ke admin agar diperbaiki."
  echo -e ""
  echo -e "𝗧𝗘𝗟𝗘𝗚𝗥𝗔𝗠: @albyy0x"
  sleep 2

  export DEBIAN_FRONTEND=noninteractive
  export NEEDRESTART_MODE=a

  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  fi

  print_info "Menginstall dan mengupdate jq..."

  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y jq

  if [ $? -eq 0 ]; then
    print_success "Install jq berhasil."
  else
    print_error "Install jq gagal."
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}

check_token() {
  echo -e "                                                       "
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]              ALBY OFFICIAL LICENSE              [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${BOLD}${YELLOW}MASUKKAN AKSES TOKEN: ${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "albyy0x" ]; then
    echo -e "${BOLD}${GREEN}AKSES BERHASIL${NC}"
  else
    echo -e "${BOLD}${RED}Token yang anda masukkan salah.${NC}"
    exit 1
  fi
  clear
}

install_theme() {
  local SELECT_THEME
  local THEME_NAME
  local THEME_URL

  while true; do
    clear
    echo " "
    echo -e "${BLUE}${BOLD}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}${BOLD}[+]${NC} ${BG_BLUE}${BRIGHT_WHITE}${BOLD}                 SELECT THEME                  ${NC} ${BLUE}${BOLD}[+]${NC}"
    echo -e "${BLUE}${BOLD}[+] =============================================== [+]${NC}"
    echo " "
    echo -e "${BRIGHT_CYAN}${BOLD}--- STANDARD THEME ---${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[1]${NC} ${WHITE}Stellar${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[2]${NC} ${WHITE}Billing${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[3]${NC} ${WHITE}Enigma${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[4]${NC} ${WHITE}Elysium${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[5]${NC} ${WHITE}Frostcore (Original Style)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[6]${NC} ${WHITE}Nightcore (Original Style)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[7]${NC} ${WHITE}IceMinecraft (Original Style)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[8]${NC} ${WHITE}Noobe (Original Style)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[9]${NC} ${WHITE}Reviactyl${NC}"
    echo " "
    echo -e "${BRIGHT_MAGENTA}${BOLD}--- BLUEPRINT THEME ---${NC}"
    echo -e "${BG_RED}${BRIGHT_WHITE} (!) WAJIB INSTALL BLUEPRINT DULU (OPSI #2 DI MENU UTAMA) ${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b1]${NC} ${WHITE}Nebula V1.8-3${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b2]${NC} ${WHITE}Nebula V2.0-1${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b3]${NC} ${WHITE}Recolor (Original Style)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b4]${NC} ${WHITE}NavySeals${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b5]${NC} ${WHITE}LememTheme (Original Style)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b6]${NC} ${WHITE}Darkenate (Original Style)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b7]${NC} ${WHITE}AbyssPurple (Original Style)${NC}"
    echo " "
    echo -e " ${BRIGHT_WHITE}${BOLD}[x]${NC} ${WHITE}Kembali ke Menu Utama${NC}"
    echo " "
    echo -n -e "${BOLD}Masukkan pilihan (1-9/b1-7 atau x)${NC}${BOLD}: ${NC}"
    read SELECT_THEME
    case "$SELECT_THEME" in
      1) THEME_NAME="Stellar";      THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/stellar.zip";       break;;
      2) THEME_NAME="Billing";      THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/billing.zip";       break;;
      3) THEME_NAME="Enigma";       THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/enigma.zip";        break;;
      4) THEME_NAME="Elysium";      THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/elysium.zip";       break;;
      5) THEME_NAME="Frostcore";    THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/frostcore.zip";     break;;
      6) THEME_NAME="Nightcore";    THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/nightcore.zip";     break;;
      7) THEME_NAME="IceMinecraft"; THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/ice.zip";           break;;
      8) THEME_NAME="Noobe";        THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/noobe.zip";         break;;
      9) install_timpa "https://github.com/reviactyl/panel/releases/latest/download/panel.tar.gz" "Reviactyl"; return;;
      [bB]1) THEME_NAME="Nebula V1.8-3";  THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/nebula_v1.8-3.zip"; break;;
      [bB]2) THEME_NAME="Nebula V2.0-1";  THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/nebula_v2.0-1.zip"; break;;
      [bB]3) THEME_NAME="Recolor";        THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/recolor.zip";       break;;
      [bB]4) THEME_NAME="NavySeals";      THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/navyseals.zip";     break;;
      [bB]5) THEME_NAME="LememTheme";     THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/lemem.zip";         break;;
      [bB]6) THEME_NAME="Darkenate";      THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/darkenate.zip";     break;;
      [bB]7) THEME_NAME="AbyssPurple";    THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/abysspurple.zip";   break;;
      x|X) echo -e "${BOLD}Instalasi dibatalkan.${NC}"; return;;
      *) print_error "Pilihan tidak valid, silahkan coba lagi.";;
    esac
  done

  echo " "
  echo -n -e "${BOLD}Anda memilih tema '$THEME_NAME'. Lanjutkan? (y/n): ${NC}"
  read confirmation
  if [[ "$confirmation" != [yY] ]]; then echo -e "${BOLD}Instalasi dibatalkan.${NC}"; return; fi

  set -e
  export DEBIAN_FRONTEND=noninteractive
  export NEEDRESTART_MODE=a

  TEMP_DIR=$(mktemp -d)
  trap 'rm -rf -- "$TEMP_DIR"' EXIT
  cd "$TEMP_DIR"

  print_info "Memulai instalasi tema $THEME_NAME..."

  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y ca-certificates curl gnupg zip unzip git wget

  if [ "$SELECT_THEME" == "3" ]; then
    echo -n -e "${BOLD}Masukkan link whatsapp (diawali https://): ${NC}"; read LINK_ADMIN
    echo -n -e "${BOLD}Masukkan link channel whatsapp (diawali https://): ${NC}"; read LINK_CHANNEL
    echo -n -e "${BOLD}Masukkan link grup whatsapp (diawali https://): ${NC}"; read LINK_GROUP
  fi

  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  fi

  print_info "[1/4] Mengunduh file tema..."
  wget -q "$THEME_URL"
  local THEME_ZIP_FILE=$(basename "$THEME_URL")

  print_info "[2/4] Mengekstrak file tema..."
  if [[ "$THEME_ZIP_FILE" == *.tar.gz ]]; then
    tar -xzf "$THEME_ZIP_FILE"
  else
    unzip -oq "$THEME_ZIP_FILE" || true
  fi

  rm -f "$THEME_ZIP_FILE"

  if [[ "$SELECT_THEME" == [bB]* ]]; then
    print_info "[3/4] Menyiapkan Blueprint..."
    if [ ! -f "/var/www/pterodactyl/blueprint.sh" ]; then
      print_error "Blueprint belum terinstall."
      return 1
    fi

    FOUND_FILE=$(find . -maxdepth 1 -name "*.blueprint" -print -quit)
    if [ -z "$FOUND_FILE" ]; then
      print_error "File .blueprint tidak ditemukan dalam zip!"
      return 1
    fi

    BLUEPRINT_FILENAME=$(basename "$FOUND_FILE")
    IDENTIFIER="${BLUEPRINT_FILENAME%.*}"
    sudo mv "$BLUEPRINT_FILENAME" /var/www/pterodactyl/

    print_info "[4/4] Menginstall via Blueprint..."
    cd /var/www/pterodactyl
    sudo blueprint -install "$IDENTIFIER"
    sudo chown -R www-data:www-data /var/www/pterodactyl
    sudo rm "/var/www/pterodactyl/$BLUEPRINT_FILENAME"

    print_success "Tema '$THEME_NAME' berhasil diinstall."
  else
    if [ "$SELECT_THEME" == "3" ]; then
      print_info "Mengkonfigurasi variabel Enigma..."
      sed -i "s|LINK_ADMIN|$LINK_ADMIN|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      sed -i "s|LINK_CHANNEL|$LINK_CHANNEL|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      sed -i "s|LINK_GROUP|$LINK_GROUP|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    fi

    print_info "[3/4] Menyalin file..."
    sudo cp -rfT pterodactyl /var/www/pterodactyl
    cd /var/www/pterodactyl

    print_info "Memeriksa versi Node.js..."
    CURRENT_NODE_VER=$(node -v 2>/dev/null | cut -d'.' -f1 | sed 's/v//')

    if [[ "$CURRENT_NODE_VER" == "22" ]]; then
      print_success "Node.js v22 sudah terinstall. Instalasi ulang dilewati."
    else
      if [[ -z "$CURRENT_NODE_VER" ]]; then
        print_warning "Node.js tidak terdeteksi di sistem. Memulai instalasi Node.js v22..."
      else
        print_warning "Versi Node.js tidak sesuai (Terdeteksi: v$CURRENT_NODE_VER). Menginstall Node.js v22..."
      fi
      unset NVM_DIR
      sudo apt-get remove -y nodejs npm > /dev/null 2>&1 || true
      sudo apt-get purge -y nodejs > /dev/null 2>&1 || true
      sudo rm -f /usr/bin/node /usr/local/bin/node /usr/bin/npm /usr/local/bin/npm
      sudo rm -rf /etc/apt/sources.list.d/nodesource.list
      sudo rm -rf "$HOME/.nvm"
      sudo mkdir -p /etc/apt/keyrings
      curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor --yes | sudo tee /etc/apt/keyrings/nodesource.gpg > /dev/null
      echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
      sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
      sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y nodejs
    fi

    hash -r
    sudo npm i -g yarn

    print_info "Menginstal dependensi build..."
    yarn add cross-env react-feather
    yarn install

    if [ "$SELECT_THEME" == "2" ]; then
      print_info "Menjalankan instalasi Billing..."
      php artisan billing:install stable
    fi

    print_info "[4/4] Membangun aset panel..."
    print_warning "Proses build sedang berjalan. Mohon bersabar dan JANGAN tutup terminal sampai proses selesai!"
    RAM_SIZE=$(free -m | awk '/Mem:/ {print $2}')
    if [ "$RAM_SIZE" -lt 4000 ]; then
      print_warning "Di RAM kecil mungkin proses buildnya akan memakan waktu sedikit lebih lama."
    fi

    export NODE_OPTIONS=--openssl-legacy-provider
    php artisan migrate --force
    yarn build:production
    php artisan view:clear
    php artisan optimize:clear

    print_success "Tema '$THEME_NAME' berhasil diinstall."
  fi

  echo " "
  log_success "[+] =============================================== [+]"
  log_success "[+]          INSTALASI BERHASIL SELESAI             [+]"
  log_success "[+] =============================================== [+]"
  echo " "
  sleep 3
  return 0
}

install_timpa() {
  local TARGET_URL=$1
  local TARGET_NAME=$2

  echo " "
  echo -n -e "${BOLD}Anda memilih tema '$TARGET_NAME'. Lanjutkan? (y/n): ${NC}"
  read confirmation
  if [[ "$confirmation" != [yY] ]]; then echo -e "${BOLD}Instalasi dibatalkan.${NC}"; return; fi

  set -e
  export DEBIAN_FRONTEND=noninteractive
  export NEEDRESTART_MODE=a

  TEMP_DIR=$(mktemp -d)
  trap 'rm -rf -- "$TEMP_DIR"' EXIT

  print_info "Memulai instalasi tema $TARGET_NAME..."

  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  fi

  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
  PHP_CLI_VERSION=$(php -v | head -n 1 | awk '{print $2}' | cut -d. -f1,2)
  PHP_WEB_VERSION=$(systemctl list-units --type=service | grep -oP 'php[0-9\.]+-fpm' | grep -oP '[0-9\.]+' | head -n 1)
  if [ -z "$PHP_WEB_VERSION" ]; then PHP_WEB_VERSION=$PHP_CLI_VERSION; fi
  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y \
    ca-certificates curl gnupg zip unzip git wget redis-server \
    php${PHP_CLI_VERSION}-common php${PHP_CLI_VERSION}-cli php${PHP_CLI_VERSION}-gd \
    php${PHP_CLI_VERSION}-mbstring php${PHP_CLI_VERSION}-bcmath php${PHP_CLI_VERSION}-xml \
    php${PHP_CLI_VERSION}-curl php${PHP_CLI_VERSION}-zip php${PHP_CLI_VERSION}-intl \
    php${PHP_CLI_VERSION}-sqlite3 php${PHP_CLI_VERSION}-mysql php${PHP_CLI_VERSION}-fpm php${PHP_CLI_VERSION}-redis \
    php${PHP_WEB_VERSION}-common php${PHP_WEB_VERSION}-cli php${PHP_WEB_VERSION}-gd \
    php${PHP_WEB_VERSION}-mbstring php${PHP_WEB_VERSION}-bcmath php${PHP_WEB_VERSION}-xml \
    php${PHP_WEB_VERSION}-curl php${PHP_WEB_VERSION}-zip php${PHP_WEB_VERSION}-intl \
    php${PHP_WEB_VERSION}-sqlite3 php${PHP_WEB_VERSION}-mysql php${PHP_WEB_VERSION}-fpm php${PHP_WEB_VERSION}-redis
  sudo phpenmod -v ${PHP_CLI_VERSION} redis || true
  sudo phpenmod -v ${PHP_WEB_VERSION} redis || true
  sudo systemctl enable redis-server || true
  sudo systemctl start redis-server || true

  print_info "[1/4] Mengunduh file panel/tema..."
  cd "$TEMP_DIR"

  if [[ "$TARGET_URL" == *.zip ]]; then
    FILE_EXT="zip"
    FILENAME="panel.zip"
  else
    FILE_EXT="tar.gz"
    FILENAME="panel.tar.gz"
  fi

  wget -q -O "$FILENAME" "$TARGET_URL"

  print_info "[2/4] Mempersiapkan direktori & Backup Config..."

  if [ ! -d "/var/www/pterodactyl" ]; then
    print_error "Direktori Pterodactyl tidak ditemukan."
    return 1
  fi

  cd /var/www/pterodactyl
  php artisan down || true

  if [ -f ".env" ]; then
    cp .env /tmp/.env.backup
  fi

  sudo find . -mindepth 1 -delete
  sudo rm -f /usr/local/bin/blueprint

  print_info "[3/4] Mengekstrak file & Mengembalikan konfigurasi..."

  if [[ "$FILE_EXT" == "zip" ]]; then
    unzip -o "$TEMP_DIR/$FILENAME" -d /var/www/pterodactyl/
  else
    tar -xzf "$TEMP_DIR/$FILENAME" -C /var/www/pterodactyl/
  fi

  if [ -f "/tmp/.env.backup" ]; then
    mv /tmp/.env.backup .env
  fi

  sudo chmod -R 755 storage/* bootstrap/cache/
  sudo chown -R www-data:www-data /var/www/pterodactyl

  print_info "[4/4] Menginstal dependensi & Membangun aset..."
  if ! command -v composer; then
    curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
  fi

  sudo rm -rf /var/www/.cache
  sudo mkdir -p /var/www/.cache
  sudo chown -R www-data:www-data /var/www/.cache
  sudo -u www-data env COMPOSER_PROCESS_TIMEOUT=2000 composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist
  sudo -u www-data php artisan migrate --seed --force
  sudo -u www-data php artisan view:clear
  sudo -u www-data php artisan config:clear
  sudo -u www-data php artisan up

  if [[ "${TARGET_NAME,,}" == *"reviactyl"* ]]; then
    print_info "Mengalihkan backend dari Wings ke Reviactyl Agent..."

    sudo systemctl stop wings >/dev/null 2>&1 || true
    sudo systemctl disable wings >/dev/null 2>&1 || true
    sudo systemctl stop agent >/dev/null 2>&1 || true

    curl -L -o /usr/local/bin/agent "https://github.com/reviactyl/agent/releases/latest/download/agent_linux_$([[ "$(uname -m)" == "x86_64" ]] && echo "amd64" || echo "arm64")"
    sudo chmod u+x /usr/local/bin/agent

    sudo mkdir -p /var/run/agent
    sudo chown root:root /var/run/agent

    sudo mkdir -p /etc/reviactyl >/dev/null 2>&1 || true
    sudo cp /etc/pterodactyl/config.yml /etc/reviactyl/config.yml

    cat << 'EOF_AGENT' | sudo tee /etc/systemd/system/agent.service > /dev/null
[Unit]
Description=Reviactyl Agent
After=docker.service
Requires=docker.service
PartOf=docker.service

[Service]
User=root
WorkingDirectory=/etc/reviactyl
LimitNOFILE=4096
PIDFile=/var/run/agent/daemon.pid
ExecStart=/usr/local/bin/agent
Restart=on-failure
StartLimitInterval=180
StartLimitBurst=30
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF_AGENT

    sudo systemctl daemon-reload
    sudo systemctl enable --now agent >/dev/null 2>&1 || true
    print_info "Reviactyl Agent berhasil diinstal dan dijalankan."
  fi

  print_success "Tema '$TARGET_NAME' berhasil diinstall."
  echo " "
  log_success "[+] =============================================== [+]"
  log_success "[+]          INSTALASI BERHASIL SELESAI             [+]"
  log_success "[+] =============================================== [+]"
  echo " "
  sleep 3
}

uninstall_theme() {
  echo " "
  log_info "[+] =============================================== [+]"
  log_info "[+]       RESET PANEL (UNINSTALL THEME/TOOLS)       [+]"
  log_info "[+] =============================================== [+]"
  echo " "

  while true; do
    echo -n -e "${BOLD}Apakah Anda benar-benar yakin ingin melanjutkan? (y/n): ${NC}"
    read yn
    case $yn in
      [Yy]*)
        set -e
        if [ ! -d "/var/www/pterodactyl" ]; then
          print_error "Direktori Pterodactyl tidak ditemukan."
          return 1
        fi
        cd /var/www/pterodactyl || { print_error "Gagal masuk ke direktori Pterodactyl."; return 1; }

        print_info "⚙️  Memulai proses reset panel..."

        echo -e "${BOLD}   - Mem-backup file .env...${NC}"
        TEMP_BACKUP=$(mktemp -d)
        if [ -f ".env" ]; then sudo mv .env "$TEMP_BACKUP/"; fi

        echo -e "${BOLD}   - Menghapus semua file panel lama...${NC}"
        sudo find . -mindepth 1 -delete

        echo -e "${BOLD}   - Mengunduh panel original terbaru...${NC}"
        curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | sudo tar -xzf - -C /var/www/pterodactyl

        echo -e "${BOLD}   - Mengembalikan file .env...${NC}"
        if [ -f "$TEMP_BACKUP/.env" ]; then sudo mv "$TEMP_BACKUP"/.env .; fi
        rm -rf "$TEMP_BACKUP"

        echo -e "${BOLD}   - Install ulang dependensi (Composer)...${NC}"
        PHP_CLI_VERSION=$(php -v | head -n 1 | awk '{print $2}' | cut -d. -f1,2)
        PHP_WEB_VERSION=$(systemctl list-units --type=service | grep -oP 'php[0-9\.]+-fpm' | grep -oP '[0-9\.]+' | head -n 1)
        if [ -z "$PHP_WEB_VERSION" ]; then PHP_WEB_VERSION=$PHP_CLI_VERSION; fi
        sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y \
          ca-certificates curl gnupg zip unzip git wget redis-server \
          php${PHP_CLI_VERSION}-common php${PHP_CLI_VERSION}-cli php${PHP_CLI_VERSION}-gd \
          php${PHP_CLI_VERSION}-mbstring php${PHP_CLI_VERSION}-bcmath php${PHP_CLI_VERSION}-xml \
          php${PHP_CLI_VERSION}-curl php${PHP_CLI_VERSION}-zip php${PHP_CLI_VERSION}-intl \
          php${PHP_CLI_VERSION}-sqlite3 php${PHP_CLI_VERSION}-mysql php${PHP_CLI_VERSION}-fpm php${PHP_CLI_VERSION}-redis \
          php${PHP_WEB_VERSION}-common php${PHP_WEB_VERSION}-cli php${PHP_WEB_VERSION}-gd \
          php${PHP_WEB_VERSION}-mbstring php${PHP_WEB_VERSION}-bcmath php${PHP_WEB_VERSION}-xml \
          php${PHP_WEB_VERSION}-curl php${PHP_WEB_VERSION}-zip php${PHP_WEB_VERSION}-intl \
          php${PHP_WEB_VERSION}-sqlite3 php${PHP_WEB_VERSION}-mysql php${PHP_WEB_VERSION}-fpm php${PHP_WEB_VERSION}-redis
        sudo phpenmod -v ${PHP_CLI_VERSION} redis || true
        sudo phpenmod -v ${PHP_WEB_VERSION} redis || true
        sudo systemctl enable redis-server || true
        sudo systemctl start redis-server || true

        sudo chmod -R 755 storage/* bootstrap/cache/
        sudo chown -R www-data:www-data /var/www/pterodactyl
        curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
        sudo rm -rf /var/www/.cache
        sudo mkdir -p /var/www/.cache
        sudo chown -R www-data:www-data /var/www/.cache
        sudo -u www-data env COMPOSER_PROCESS_TIMEOUT=2000 composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

        echo -e "${BOLD}   - Menjalankan migrasi...${NC}"
        sudo -u www-data php artisan migrate --seed --force

        echo -e "${BOLD}   - Membersihkan cache sistem...${NC}"
        sudo -u www-data php artisan optimize:clear
        sudo -u www-data php artisan view:clear
        sudo -u www-data php artisan config:clear
        sudo -u www-data php artisan route:clear
        sudo -u www-data php artisan cache:clear
        sudo rm -f /usr/local/bin/blueprint

        if systemctl list-unit-files | grep -q "agent.service"; then
          echo -e "${BOLD}   - Membersihkan Reviactyl Agent & Mengembalikan Wings...${NC}"
          sudo systemctl stop agent >/dev/null 2>&1 || true
          sudo systemctl disable agent >/dev/null 2>&1 || true
          sudo rm -f /etc/systemd/system/agent.service
          sudo rm -f /usr/local/bin/agent
          sudo rm -rf /etc/reviactyl
          sudo systemctl daemon-reload
        fi

        if systemctl list-unit-files | grep -q "wings.service"; then
          sudo systemctl enable --now wings >/dev/null 2>&1 || true
        fi

        echo -e "${BOLD}   - Restart layanan webserver & worker...${NC}"
        sudo systemctl restart nginx || sudo systemctl restart apache2
        PHP_SERVICES=$(systemctl list-unit-files | grep -oE "php[0-9\.]+-fpm\.service" | tr "\n" " ")
        if [ ! -z "$PHP_SERVICES" ]; then
          sudo systemctl restart $PHP_SERVICES || true
        fi
        sudo systemctl restart pteroq
        sudo -u www-data php artisan up
        break
        ;;
      [Nn]*)
        echo -e "\n${BOLD}❌ Operasi dibatalkan oleh pengguna.${NC}"
        return
        ;;
      *)
        echo -e "\n${BOLD}Pilihan tidak valid! Silahkan pilih (y) atau (n).${NC}"
        ;;
    esac
  done

  echo " "
  log_success "[+] =============================================== [+]"
  log_success "[+]             PANEL BERHASIL DI-RESET             [+]"
  log_success "[+] =============================================== [+]"
  echo " "
  sleep 3
  return 0
}

uninstall_panel() {
  echo " "
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]                  UNINSTALL PANEL                [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo " "
  echo -n -e "${BOLD}Apakah Anda yakin ingin melanjutkan? (y/n): ${NC}"
  read confirmation
  if [[ "$confirmation" != [yY] ]]; then echo -e "${BOLD}Uninstall dibatalkan.${NC}"; return; fi

  print_info "Memulai proses uninstall..."

  if [ -f "/var/www/pterodactyl/.env" ]; then
    print_info "Mencoba menghapus database panel..."
    DB_NAME=$(grep "^DB_DATABASE=" /var/www/pterodactyl/.env | cut -d'=' -f2)
    DB_USER=$(grep "^DB_USERNAME=" /var/www/pterodactyl/.env | cut -d'=' -f2)
    DB_PASS=$(grep "^DB_PASSWORD=" /var/www/pterodactyl/.env | cut -d'=' -f2)
    mysql -u root -e "DROP DATABASE IF EXISTS $DB_NAME; DROP USER IF EXISTS '$DB_USER'@'127.0.0.1';" > /dev/null 2>&1 || true
    print_success "Database cleaning selesai."
  else
    print_warning "File .env tidak ditemukan, melewati penghapusan database otomatis."
  fi

  print_info "Menghentikan layanan pterodactyl..."
  systemctl disable --now wings pteroq > /dev/null 2>&1 || true
  systemctl disable --now redis-server > /dev/null 2>&1 || true
  systemctl disable --now redis > /dev/null 2>&1 || true
  PHP_SERVICES=$(systemctl list-unit-files | grep -oE "php[0-9\.]+-fpm\.service" | tr "\n" " ")
  if [ ! -z "$PHP_SERVICES" ]; then
    systemctl disable --now $PHP_SERVICES > /dev/null 2>&1 || true
  fi
  systemctl stop nginx apache2 > /dev/null 2>&1 || true

  print_info "Membersihkan Cronjob..."
  (crontab -l 2>/dev/null | grep -v "pterodactyl" | crontab -) || true

  print_info "Menghapus file sistem Pterodactyl..."
  rm -rf /var/www/pterodactyl
  rm -rf /etc/pterodactyl
  rm -rf /var/lib/pterodactyl
  rm -f /usr/local/bin/wings
  rm -f /usr/local/bin/composer
  rm -f /usr/local/bin/blueprint

  print_info "Menghapus konfigurasi service..."
  rm -f /etc/systemd/system/wings.service
  rm -f /etc/systemd/system/pteroq.service
  systemctl daemon-reload

  print_info "Menghapus konfigurasi webserver..."
  rm -f /etc/nginx/sites-enabled/pterodactyl.conf
  rm -f /etc/nginx/sites-available/pterodactyl.conf
  rm -f /etc/nginx/conf.d/pterodactyl.conf
  rm -f /etc/apache2/sites-enabled/pterodactyl.conf
  rm -f /etc/apache2/sites-available/pterodactyl.conf
  rm -f /etc/php/*/fpm/pool.d/www-pterodactyl.conf
  rm -f /etc/php-fpm.d/www-pterodactyl.conf
  if [ -f /etc/nginx/sites-available/default ] && [ ! -L /etc/nginx/sites-enabled/default ]; then
    ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default > /dev/null 2>&1 || true
  fi

  print_info "Membersihkan sisa Docker..."
  docker rm -f $(docker ps -a -q) > /dev/null 2>&1 || true
  docker system prune -af > /dev/null 2>&1 || true

  print_info "Merestart layanan sistem..."
  systemctl restart nginx > /dev/null 2>&1 || true
  systemctl restart apache2 > /dev/null 2>&1 || true

  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]             UNINSTALL PANEL SUKSES              [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 3
  return 0
}

start_wings() {
  echo -e "                                                       "
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]                 CONFIGURE WINGS                 [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  read -p "Masukkan token Auto-Deploy untuk menjalankan wings: " wings
  eval "$wings"
  sudo systemctl start wings
  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]             CONFIGURE WINGS SUKSES              [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 3
  return 0
}

create_node() {
  set -e
  echo " "
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]            MEMULAI CREATE NODE SCRIPT           [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo " "

  bash <(curl -s https://raw.githubusercontent.com/Bangsano/themeinstaller/main/createnode.sh)

  if [ $? -ne 0 ]; then
    print_error "🚨 TERJADI ERROR saat menjalankan skrip 'createnode.sh'."
    return 1
  fi

  echo " "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]         CREATE NODE & LOCATION SUCCESS          [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo " "
  sleep 3
  return 0
}

hackback_panel() {
  echo -e "                                                       "
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]                  HACK BACK PANEL                [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  read -p "Masukkan Username Panel Baru: " user
  read -sp "Masukkan Password Baru (password tidak akan ditampilkan): " pwhb
  echo

  if [[ -z "$user" || -z "$pwhb" ]]; then
    print_error "Username dan Password tidak boleh kosong!"
    return 1
  fi

  if ! cd /var/www/pterodactyl; then
    print_error "Gagal pindah ke direktori /var/www/pterodactyl. Pastikan Pterodactyl terinstal."
    return 1
  fi

  print_info "Membuat user admin baru..."
  if ! printf 'yes\n%s@admin.com\n%s\n%s\n%s\n%s\n' "$user" "$user" "$user" "$user" "$pwhb" | php artisan p:user:make; then
    print_error "Gagal menjalankan perintah 'php artisan p:user:make'. Periksa log Pterodactyl."
    return 1
  fi

  local panel_url="URL Panel tidak ditemukan"
  local env_file="/var/www/pterodactyl/.env"
  if [[ -f "$env_file" ]]; then
    local app_url_line=$(grep '^APP_URL=' "$env_file")
    if [[ -n "$app_url_line" ]]; then
      panel_url=${app_url_line#APP_URL=}
      panel_url=$(echo "$panel_url" | tr -d '"')
      if [[ ! "$panel_url" =~ ^https?:// ]]; then
        panel_url="https://$panel_url"
      fi
    else
      print_warning "Baris APP_URL tidak ditemukan di $env_file."
    fi
  else
    print_warning "File $env_file tidak ditemukan."
  fi

  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]               AKUN TELAH DITAMBAHKAN            [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] ----------------------------------------------- [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] Username: $user${NC}"
  echo -e "${BOLD}${GREEN}[+] Password: (Password yang Anda masukkan tadi)${NC}"
  echo -e "${BOLD}${GREEN}[+] URL Panel: $panel_url${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 4
  return 0
}

ubahpw_vps() {
  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]                UBAH PASSWORD VPS                [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  while true; do
    read -p "Masukkan Password Baru: " pw1
    echo
    read -p "Masukkan Ulang Password Baru: " pw2
    echo
    if [[ "$pw1" == "$pw2" ]]; then
      break
    else
      print_error "Password tidak cocok! Silakan coba lagi."
    fi
  done

  print_info "Mengubah password..."
  passwd <<EOF
$pw1
$pw1
EOF

  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${BOLD}${GREEN}[+]            GANTI PASSWORD VPS SUKSES            [+]${NC}"
    echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    sleep 3
    return 0
  else
    print_error "Gagal mengubah password. Silakan periksa log sistem."
    sleep 3
    return 1
  fi
}

install_blueprint() {
  unset NVM_DIR
  unset NVM_CD_FLAGS
  unset NVM_BIN
  unset NVM_INC
  export PATH=$(echo $PATH | tr ":" "\n" | grep -v "nvm" | tr "\n" ":")
  export DEBIAN_FRONTEND=noninteractive
  export NEEDRESTART_MODE=a

  set -e
  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]                INSTALL BLUEPRINT                [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  echo -n -e "${BOLD}Apakah anda yakin ingin melanjutkannya? (y/n): ${NC}"
  read confirmation
  if [[ "$confirmation" != [yY] ]]; then
    echo -e "${BOLD}Instalasi dibatalkan.${NC}"
    return
  fi

  print_info "Menginstal dependensi dasar..."
  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y ca-certificates curl gnupg zip unzip git wget

  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  fi

  print_info "Mengunduh dan mengekstrak Blueprint Framework..."
  DOWNLOAD_URL=$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | grep 'release.zip' | cut -d '"' -f 4)
  if [ -z "$DOWNLOAD_URL" ]; then
    print_error "Gagal mendapatkan link download Blueprint!"
    return 1
  fi
  wget -q "$DOWNLOAD_URL" -O /tmp/blueprint.zip
  unzip -oq /tmp/blueprint.zip -d /var/www/pterodactyl
  rm /tmp/blueprint.zip

  print_info "Memeriksa versi Node.js..."
  CURRENT_NODE_VER=$(node -v 2>/dev/null | cut -d'.' -f1 | sed 's/v//')

  if [[ "$CURRENT_NODE_VER" == "22" ]]; then
    print_success "Node.js v22 sudah terinstall. Instalasi ulang dilewati."
  else
    if [[ -z "$CURRENT_NODE_VER" ]]; then
      print_warning "Node.js tidak terdeteksi di sistem. Memulai instalasi Node.js v22..."
    else
      print_warning "Versi Node.js tidak sesuai (Terdeteksi: v$CURRENT_NODE_VER). Menginstall Node.js v22..."
    fi
    unset NVM_DIR
    sudo apt-get remove -y nodejs npm > /dev/null 2>&1 || true
    sudo apt-get purge -y nodejs > /dev/null 2>&1 || true
    sudo rm -f /usr/bin/node /usr/local/bin/node /usr/bin/npm /usr/local/bin/npm
    sudo rm -rf /etc/apt/sources.list.d/nodesource.list
    sudo rm -rf "$HOME/.nvm"
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor --yes | sudo tee /etc/apt/keyrings/nodesource.gpg > /dev/null
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
    sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
    sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y nodejs
  fi

  hash -r
  sudo npm i -g yarn

  print_info "Menginstal dependensi Pterodactyl..."
  cd /var/www/pterodactyl
  yarn add cross-env
  yarn install

  print_info "Menjalankan blueprint.sh..."
  cd /var/www/pterodactyl
  sed -i -E -e "s|WEBUSER=\"www-data\" #;|WEBUSER=\"www-data\" #;|g" \
             -e "s|USERSHELL=\"/bin/bash\" #;|USERSHELL=\"/bin/bash\" #;|g" \
             -e "s|OWNERSHIP=\"www-data:www-data\" #;|OWNERSHIP=\"www-data:www-data\" #;|g" blueprint.sh
  chmod +x blueprint.sh
  yes | sudo bash blueprint.sh

  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]          INSTALLASI BLUEPRINT SELESAI           [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 3
  return 0
}

install_auto_suspend() {
  set -e
  export DEBIAN_FRONTEND=noninteractive
  export NEEDRESTART_MODE=a

  echo " "
  log_info "[+] =============================================== [+]"
  log_info "[+]            INSTALL FITUR AUTO SUSPEND           [+]"
  log_info "[+] =============================================== [+]"
  echo " "
  echo -e "${BOLD}Fitur ini akan menambahkan fungsionalitas auto-suspend server.${NC}"
  echo -n -e "${BOLD}Lanjutkan instalasi? (y/n): ${NC}"
  read confirmation
  if [[ "$confirmation" != [yY] ]]; then
    echo -e "${BOLD}Instalasi dibatalkan.${NC}"
    return
  fi

  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  fi

  print_info "Memeriksa versi Node.js..."
  CURRENT_NODE_VER=$(node -v 2>/dev/null | cut -d'.' -f1 | sed 's/v//')

  if [[ "$CURRENT_NODE_VER" == "22" ]]; then
    print_success "Node.js v22 sudah terinstall. Instalasi ulang dilewati."
  else
    if [[ -z "$CURRENT_NODE_VER" ]]; then
      print_warning "Node.js tidak terdeteksi di sistem. Memulai instalasi Node.js v22..."
    else
      print_warning "Versi Node.js tidak sesuai (Terdeteksi: v$CURRENT_NODE_VER). Menginstall Node.js v22..."
    fi
    unset NVM_DIR
    sudo apt-get remove -y nodejs npm > /dev/null 2>&1 || true
    sudo apt-get purge -y nodejs > /dev/null 2>&1 || true
    sudo rm -f /usr/bin/node /usr/local/bin/node /usr/bin/npm /usr/local/bin/npm
    sudo rm -rf /etc/apt/sources.list.d/nodesource.list
    sudo rm -rf "$HOME/.nvm"
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor --yes | sudo tee /etc/apt/keyrings/nodesource.gpg > /dev/null
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
    sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
    sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y nodejs
  fi

  hash -r
  sudo npm i -g yarn

  TEMP_DIR=$(mktemp -d)
  trap 'rm -rf -- "$TEMP_DIR"' EXIT
  cd "$TEMP_DIR"

  print_info "Mengunduh file autosuspend.zip..."
  wget -q https://github.com/Bangsano/themeinstaller/raw/main/autosuspend.zip

  print_info "Mengekstrak file..."
  unzip -oq autosuspend.zip || true

  print_info "Menyalin file migrasi database..."
  sudo cp -rf pterodactyl/* /var/www/pterodactyl/

  print_info "Menerapkan modifikasi sistem..."
  cd /var/www/pterodactyl

  sed -i "/use Ramsey\\\\Uuid\\\\Uuid;/a use Pterodactyl\\\\Models\\\\Server;" app/Console/Kernel.php
  if ! grep -q "Server::where('exp_date'" app/Console/Kernel.php; then
    sed -i "/\\\$schedule->command(CleanServiceBackupFilesCommand::class)->daily();/a \\
    \\
        \$schedule->call(function () { \\
            \$servers = Server::where('exp_date', '<', now())->get(); \\
            \$suspensionService = \\\\App::make('Pterodactyl\\\\Services\\\\Servers\\\\SuspensionService'); \\
            foreach (\$servers as \$server) { \\
                if(\$server->status != 'suspended') { \\
                    if(\$server->status != 'installing') { \\
                        if(\$server->exp_date != null) { \\
                            \$suspensionService->toggle(\$server, 'suspend'); \\
                        } \\
                    } \\
                } \\
            } \\
        })->dailyAt('23:55');" app/Console/Kernel.php
  fi

  sed -i "/'owner_id', 'external_id', 'name', 'description',/a \\\t\t\t'exp_date'," app/Http/Controllers/Admin/ServersController.php
  sed -i "/'oom_disabled' => 'sometimes|boolean',/a \\            'exp_date' => \$rules['exp_date']," app/Http/Requests/Api/Application/Servers/StoreServerRequest.php
  sed -i "/'oom_disabled' => array_get(\$data, 'oom_disabled'),/a \\            'exp_date' => array_get(\$data, 'exp_date')," app/Http/Requests/Api/Application/Servers/StoreServerRequest.php
  sed -i "/'backup_limit' => 'present|nullable|integer|min:0',/a \\        'exp_date' => 'sometimes|nullable'," app/Models/Server.php
  sed -i "/'description' => Arr::get(\$data, 'description') ?? '',/a \                'exp_date' => Arr::get(\$data, 'exp_date') ?? null," app/Services/Servers/DetailsModificationService.php
  sed -i "/'backup_limit' => Arr::get(\$data, 'backup_limit') ?? 0,/a \\                'exp_date' => Arr::get(\$data, 'exp_date') ?? null," app/Services/Servers/ServerCreationService.php
  sed -i "/'name' => \$server->name,/a \\                'exp_date' => \$server->exp_date," app/Transformers/Api/Client/ServerTransformer.php

  print_info "Menjalankan migrasi database..."
  php artisan migrate --force

  print_info "Menginstal dependensi build..."
  yarn add cross-env
  yarn install

  print_info "Membangun ulang aset panel..."
  export NODE_OPTIONS=--openssl-legacy-provider
  yarn run build:production

  print_info "Membersihkan cache..."
  php artisan optimize:clear
  php artisan view:clear
  php artisan cache:clear
  php artisan route:clear
  chown -R www-data:www-data /var/www/pterodactyl/*

  echo " "
  log_success "[+] =============================================== [+]"
  log_success "[+]      FITUR AUTO SUSPEND BERHASIL DIINSTALL      [+]"
  log_success "[+] =============================================== [+]"
  echo " "
  sleep 3
  return 0
}

# Main script
start_script

while true; do
  echo -e "\n  "
  echo -e "${BOLD}${CYAN}        _,gggggggggg.${NC}"
  echo -e "${BOLD}${CYAN}    ,ggggggggggggggggg.${NC}"
  echo -e "${BOLD}${CYAN}  ,ggggg        gggggggg.${NC}"
  echo -e "${BOLD}${CYAN} ,ggg'               'ggg.${NC}"
  echo -e "${BOLD}${CYAN}',gg       ,ggg.      'ggg:${NC}"
  echo -e "${BOLD}${CYAN}'ggg      ,gg'''  .    ggg${NC}     ${BOLD}${BLUE}Auto Installer Theme Pterodactyl${NC}"
  echo -e "${BOLD}${CYAN}gggg      gg     ,    ggg${NC}      ${BOLD}${BLUE}By Alby Official${NC}"
  echo -e "${BOLD}${CYAN}ggg:     gg.     -   ,ggg${NC}     ${BOLD}${GREEN}----------------------------------${NC}"
  echo -e "${BOLD}${CYAN} ggg:     ggg._    _,ggg${NC}       ${BOLD}${BLUE}Telegram : @albyy0x${NC}"
  echo -e "${BOLD}${CYAN} ggg.    '.'''ggggggp${NC}"
  echo -e "${BOLD}${CYAN}  'ggg    '-.__${NC}"
  echo -e "${BOLD}${CYAN}    ggg${NC}"
  echo -e "${BOLD}${CYAN}      ggg${NC}"
  echo -e "${BOLD}${CYAN}        ggg.${NC}"
  echo -e "${BOLD}${CYAN}          ggg.${NC}"
  echo -e "${BOLD}${CYAN}             b.${NC}"
  echo -e "  "
  echo -e "${BOLD} BERIKUT ADALAH LIST FITUR:${NC}"
  echo -e "${BOLD}  1. Install Themes${NC}"
  echo -e "${BOLD}  2. Install Blueprint${NC}"
  echo -e "${BOLD}  3. Install Fitur Auto Suspend${NC}"
  echo -e "${BOLD}  4. Reset Panel (menghapus semua modifikasi panel seperti tema kustom atau tools lainnya)${NC}"
  echo -e "${BOLD}  5. Uninstall Panel${NC}"
  echo -e "${BOLD}  6. Start Wings${NC}"
  echo -e "${BOLD}  7. Create Node & Location (auto node ijo)${NC}"
  echo -e "${BOLD}  8. Hack Back Panel${NC}"
  echo -e "${BOLD}  9. Ubah Password VPS${NC}"
  echo -e "${BOLD}  x. Exit${NC}"
  print_info "Jika panel mengalami eror setelah menginstall tema atau tools lainnya, silakan jalankan fitur reset panel."
  echo -n -e "${BOLD}Masukkan pilihan (1-9 atau x): ${NC}"
  read -r MENU_CHOICE

  case "$MENU_CHOICE" in
    1) install_theme ;;
    2) install_blueprint ;;
    3) install_auto_suspend ;;
    4) uninstall_theme ;;
    5) uninstall_panel ;;
    6) start_wings ;;
    7) create_node ;;
    8) hackback_panel ;;
    9) ubahpw_vps ;;
    x|X)
      echo -e "${BOLD}${YELLOW}Keluar dari skrip. Terima kasih!${NC}"
      exit 0
      ;;
    *)
      print_error "Pilihan tidak valid, silahkan coba lagi."
      sleep 2
      ;;
  esac
done
