#!/bin/bash

helpers_input() {
    if [ $# -ne 1 ]; then
        echo "Xatolik: 1 ta matnli parametr kiritilishi kerak."
        return 1
    fi

        if [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "Xatolik: parametr matn bo‘lishi kerak, raqam emas."
        return 1
    fi

    return 0
}
