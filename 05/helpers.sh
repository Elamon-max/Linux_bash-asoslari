#!/bin/bash

get_folder_count() {
  find "$1" -type d 2>/dev/null | wc -l
}

get_top_folders() {
  du -h "$1" 2>/dev/null | sort -hr | head -n 5 | nl
}

get_file_count() {
  find "$1" -type f 2>/dev/null | wc -l
}

get_conf_count() {
  find "$1" -type f -name "*.conf" 2>/dev/null | wc -l
}

get_text_file_count() {
  find "$1" -type f -exec file --mime-type {} + 2>/dev/null | grep -c 'text/plain'
}

get_executable_count() {
  find "$1" -type f -executable 2>/dev/null | wc -l
}

get_log_count() {
  find "$1" -type f -name "*.log" 2>/dev/null | wc -l
}

get_archive_count() {
  find "$1" -type f \( -iname "*.tar" -o -iname "*.gz" -o -iname "*.zip" -o -iname "*.xz" -o -iname "*.7z" \) 2>/dev/null | wc -l
}

get_symlink_count() {
  find "$1" -type l 2>/dev/null | wc -l
}

get_top_files() {
  find "$1" -type f -exec du -b {} + 2>/dev/null | sort -nr | head -n 10 | while read -r size path; do
    ext="${path##*.}"
    echo "$(basename "$path") - $(numfmt --to=iec $size) - $ext"
  done | nl
}

get_top_execs() {
  find "$1" -type f -executable -exec du -b {} + 2>/dev/null | sort -nr | head -n 10 | while read -r size path; do
    hash=$(md5sum "$path" 2>/dev/null | awk '{print $1}')
    echo "$path, $(numfmt --to=iec $size), $hash"
  done | nl
}
