#!/bin/bash

# ==========================================
# 1. KONFIGURATSIYA FAYLINI O'QISH VA DEFAULT QIYMATLAR
# ==========================================

# Faylni o'qiymiz (agar yo'q bo'lsa xato bermaydi)
source ./config.conf 2>/dev/null

# 1-parametr (Nomlar foni) - Default: Qora (6)
if [[ -z "$column1_background" ]]; then
    col1_bg_val=6
    col1_bg_text="default"
else
    col1_bg_val="$column1_background"
    col1_bg_text="$column1_background"
fi

# 2-parametr (Nomlar shrifti) - Default: Oq (1)
if [[ -z "$column1_font_color" ]]; then
    col1_fg_val=1
    col1_fg_text="default"
else
    col1_fg_val="$column1_font_color"
    col1_fg_text="$column1_font_color"
fi

# 3-parametr (Qiymatlar foni) - Default: Qizil (2)
if [[ -z "$column2_background" ]]; then
    col2_bg_val=2
    col2_bg_text="default"
else
    col2_bg_val="$column2_background"
    col2_bg_text="$column2_background"
fi

# 4-parametr (Qiymatlar shrifti) - Default: Ko'k (4)
if [[ -z "$column2_font_color" ]]; then
    col2_fg_val=4
    col2_fg_text="default"
else
    col2_fg_val="$column2_font_color"
    col2_fg_text="$column2_font_color"
fi

# ==========================================
# 2. XATOLIKLARNI TEKSHIRISH (VALIDATSIYA)
# ==========================================

# Nomlar ustuni uchun ranglar to'qnashuvini tekshirish
if [[ "$col1_bg_val" -eq "$col1_fg_val" ]]; then
  echo "Xato: Nomlar uchun fon va shrift rangi bir xil bo'lishi mumkin emas. Konfig faylni to'g'rilang."
  exit 1
fi

# Qiymatlar ustuni uchun ranglar to'qnashuvini tekshirish
if [[ "$col2_bg_val" -eq "$col2_fg_val" ]]; then
  echo "Xato: Qiymatlar uchun fon va shrift rangi bir xil bo'lishi mumkin emas. Konfig faylni to'g'rilang."
  exit 1
fi

# ==========================================
# 3. RANGLARNI TANLASH (CASE OPERATORLARI)
# ==========================================

case "$col1_bg_val" in
    1) BG_NAME="\e[47m" ;; # Oq
    2) BG_NAME="\e[41m" ;; # Qizil
    3) BG_NAME="\e[42m" ;; # Yashil
    4) BG_NAME="\e[44m" ;; # Ko'k
    5) BG_NAME="\e[45m" ;; # Binafsha
    6) BG_NAME="\e[40m" ;; # Qora
    *) echo "Xato: Noma'lum rang kodi!"; exit 1 ;; 
esac

case "$col1_fg_val" in
    1) FG_NAME="\e[37m" ;; # Oq
    2) FG_NAME="\e[31m" ;; # Qizil
    3) FG_NAME="\e[32m" ;; # Yashil
    4) FG_NAME="\e[34m" ;; # Ko'k
    5) FG_NAME="\e[35m" ;; # Binafsha
    6) FG_NAME="\e[30m" ;; # Qora
    *) echo "Xato: Noma'lum rang kodi!"; exit 1 ;; 
esac

case "$col2_bg_val" in
    1) BG_VAL="\e[47m" ;; # Oq
    2) BG_VAL="\e[41m" ;; # Qizil
    3) BG_VAL="\e[42m" ;; # Yashil
    4) BG_VAL="\e[44m" ;; # Ko'k
    5) BG_VAL="\e[45m" ;; # Binafsha
    6) BG_VAL="\e[40m" ;; # Qora
    *) echo "Xato: Noma'lum rang kodi!"; exit 1 ;; 
esac

case "$col2_fg_val" in
    1) FG_VAL="\e[37m" ;; # Oq
    2) FG_VAL="\e[31m" ;; # Qizil
    3) FG_VAL="\e[32m" ;; # Yashil
    4) FG_VAL="\e[34m" ;; # Ko'k
    5) FG_VAL="\e[35m" ;; # Binafsha
    6) FG_VAL="\e[30m" ;; # Qora
    *) echo "Xato: Noma'lum rang kodi!"; exit 1 ;; 
esac

# Ranglarni standart holatga qaytarish
RESET="\e[0m"

# ==========================================
# 4. MA'LUMOTLARNI CHOP ETISH
# ==========================================

# helpers.sh ni chaqirib olamiz
source ./helpers.sh

# Funksiyani ishga tushirib, natijani halqaga jo'natamiz
collect_info | while IFS='=' read -r nom qiymat; do
    echo -e "${BG_NAME}${FG_NAME}${nom}${RESET}=${BG_VAL}${FG_VAL}${qiymat}${RESET}"
done

# ==========================================
# 5. YAKUNIY HISOBOT
# ==========================================

# Raqamni inglizcha so'zga aylantiruvchi yordamchi funksiya
get_color_name() {
    case "$1" in
        1) echo "white" ;;
        2) echo "red" ;;
        3) echo "green" ;;
        4) echo "blue" ;;
        5) echo "purple" ;;
        6) echo "black" ;;
    esac
}

echo "" # Bitta bo'sh qator
echo "Column 1 background = $col1_bg_text ($(get_color_name "$col1_bg_val"))"
echo "Column 1 font color = $col1_fg_text ($(get_color_name "$col1_fg_val"))"
echo "Column 2 background = $col2_bg_text ($(get_color_name "$col2_bg_val"))"
echo "Column 2 font color = $col2_fg_text ($(get_color_name "$col2_fg_val"))"
