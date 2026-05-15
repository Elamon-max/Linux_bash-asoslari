#!/bin/bash

if [[ $# -ne 4 ]]; then  
  echo "Xato: 4 ta raqamli parametr kiriting (1–6)."  
  exit 1
fi

# Nomlar ustuni uchun ranglar to'qnashuvini tekshirish
if [[ "$1" -eq "$2" ]]; then
  echo "Xato: Nomlar uchun fon va shrift rangi bir xil bo'lishi mumkin emas. Iltimos, skriptni qayta chaqiring."
  exit 1
fi

# Qiymatlar ustuni uchun ranglar to'qnashuvini tekshirish
if [[ "$3" -eq "$4" ]]; then
  echo "Xato: Qiymatlar uchun fon va shrift rangi bir xil bo'lishi mumkin emas. Iltimos, skriptni qayta chaqiring."
  exit 1
fi


case "$1" in
    1) BG_NAME="\e[47m" ;; # Oq
    2) BG_NAME="\e[41m" ;; # Qizil
    3) BG_NAME="\e[42m" ;; # Yashil
    4) BG_NAME="\e[44m" ;; # Ko'k
    5) BG_NAME="\e[45m" ;; # Binafsha
    6) BG_NAME="\e[40m" ;; # Qora
    *) echo "Xato: 1-parametr noma'lum rang kodi!"; exit 1 ;; 
esac

# 2-parametr: Nomlar shrifti (matn)
case "$2" in
    1) FG_NAME="\e[37m" ;; # Oq
    2) FG_NAME="\e[31m" ;; # Qizil
    3) FG_NAME="\e[32m" ;; # Yashil
    4) FG_NAME="\e[34m" ;; # Ko'k
    5) FG_NAME="\e[35m" ;; # Binafsha
    6) FG_NAME="\e[30m" ;; # Qora
    *) echo "Xato: 2-parametr noma'lum rang kodi!"; exit 1 ;; 
esac

# 3-parametr: Qiymatlar foni
case "$3" in
    1) BG_VAL="\e[47m" ;; # Oq
    2) BG_VAL="\e[41m" ;; # Qizil
    3) BG_VAL="\e[42m" ;; # Yashil
    4) BG_VAL="\e[44m" ;; # Ko'k
    5) BG_VAL="\e[45m" ;; # Binafsha
    6) BG_VAL="\e[40m" ;; # Qora
    *) echo "Xato: 3-parametr noma'lum rang kodi!"; exit 1 ;; 
esac

# 4-parametr: Qiymatlar shrifti (matn)
case "$4" in
    1) FG_VAL="\e[37m" ;; # Oq
    2) FG_VAL="\e[31m" ;; # Qizil
    3) FG_VAL="\e[32m" ;; # Yashil
    4) FG_VAL="\e[34m" ;; # Ko'k
    5) FG_VAL="\e[35m" ;; # Binafsha
    6) FG_VAL="\e[30m" ;; # Qora
    *) echo "Xato: 4-parametr noma'lum rang kodi!"; exit 1 ;; 
esac

# Ranglarni standart holatga qaytarish zaxirasi
RESET="\e[0m"

# ==========================================
# 3. BO'YASH USKUNASI (FUNKSIYA)
# ==========================================
# ... Tepadagi ranglarni tekshirish va case bloklari (o'zgarishsiz qoladi) ...
# RESET="\e[0m" gacha bo'lgan joyi oldingidek.

# 1. helpers.sh ni chaqirib olamiz
source ./helpers.sh

# 2. Funksiyani ishga tushirib, natijani quvur (|) orqali halqaga (loop) jo'natamiz:
collect_info | while IFS='=' read -r nom qiymat; do
    
    # Bu yerda Bash avtomat ravishda har bir qatorni tenglikdan ikkiga bo'ladi:
    # "nom" o'zgaruvchisiga -> "HOSTNAME " (tenglikdan chap tomon) tushadi
    # "qiymat" o'zgaruvchisiga -> " ubuntu" (tenglikdan o'ng tomon) tushadi

    # Endi ularni tayyor ranglarimiz bilan bo'yab, o'rtaga = qo'yib chiqaramiz:
    echo -e "${BG_NAME}${FG_NAME}${nom}${RESET}=${BG_VAL}${FG_VAL}${qiymat}${RESET}"

done
