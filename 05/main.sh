#!/bin/bash

source ./helpers.sh

start_time=$(date +%s.%N)

if [[ $# -ne 1 ]]; then
  echo "Faqat bitta katalog yo‘li parametri kiritilishi kerak."
  echo "Misol: ./main.sh /var/log/"
  exit 1
fi

target_dir="$1"

if [[ ! -d "$target_dir" ]]; then
  echo "Kiritilgan yo‘l katalog emas."
  exit 1
fi

if [[ "${target_dir: -1}" != "/" ]]; then
  echo "Yo‘l / bilan tugashi kerak (masalan: /var/log/)"
  exit 1
fi

echo "Total number of folders (including all nested ones) = $(get_folder_count "$target_dir")"
echo
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
get_top_folders "$target_dir"
echo
echo "Total number of files = $(get_file_count "$target_dir")"
echo
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(get_conf_count "$target_dir")"
echo "Text files = $(get_text_file_count "$target_dir")"
echo "Executable files = $(get_executable_count "$target_dir")"
echo "Log files (with the extension .log) = $(get_log_count "$target_dir")"
echo "Archive files = $(get_archive_count "$target_dir")"
echo "Symbolic links = $(get_symlink_count "$target_dir")"
echo
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
get_top_files "$target_dir"
echo
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
get_top_execs "$target_dir"
end_time=$(date +%s.%N)
duration=$(echo "$end_time - $start_time" | bc)
echo
echo "Script execution time (in seconds) = $duration"
