#!/bin/bash
# Apa? Mau nyolong?? 😹😹
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
      [bB]1) THEME_NAME="Nebula V1.8-3";      THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/nebula_v1.8-3.zip"; break;;
      [bB]2) THEME_NAME="Nebula V2.0-1";      THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/nebula_v2.0-1.zip"; break;;
      [bB]3) THEME_NAME="Recolor";            THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/recolor.zip";       break;;
      [bB]4) THEME_NAME="NavySeals";          THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/navyseals.zip";     break;;
      [bB]5) THEME_NAME="LememTheme";         THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/lemem.zip";         break;;
      [bB]6) THEME_NAME="Darkenate";          THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/darkenate.zip";     break;;
      [bB]7) THEME_NAME="AbyssPurple";        THEME_URL="https://github.com/Bangsano/themeinstaller/raw/main/theme/abysspurple.zip";   break;;
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
