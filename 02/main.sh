#!/bin/bash

source ./helpers.sh
collect_info
echo -n "Natijani faylga saqlaymizmi? [Y/N]: "
read javob
if [[ "$javob" == "Y" || "$javob" == "y" ]]; then
FILE_NAME="$(date "+%d_%m_%y_%H_%M_%S").status"
collect_info > "$FILE_NAME"
echo "Ma'lumotlar $FILE_NAME faylga saqlandi."
else
    echo "Faylga saqlanmadi."
fi
