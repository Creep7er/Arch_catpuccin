#!/bin/bash

# Проверка переменной DISPLAY
if [ -z "$DISPLAY" ]; then
    export DISPLAY=:0
fi

# Разрешаем доступ к дисплею
xhost +SI:localuser:$(whoami) >/dev/null 2>&1

# Получаем список Bluetooth устройств
devices=$(bluetoothctl devices | awk '{print $2 " " $3 " " $4}')

# Проверяем, найдены ли устройства
if [ -z "$devices" ]; then
    echo "Нет доступных Bluetooth устройств."
    exit 1
fi

# Запускаем wofi и выбираем устройство
selected_device=$(echo "$devices" | wofi --dmenu -p "Bluetooth Devices")

# Проверяем, выбрано ли устройство
if [[ -n "$selected_device" ]]; then
    # Извлекаем MAC-адрес устройства
    device_mac=$(echo "$selected_device" | awk '{print $1}')
    
    # Подключаемся или отключаемся
    if bluetoothctl info "$device_mac" | grep -q "Connected: yes"; then
        bluetoothctl disconnect "$device_mac"
    else
        bluetoothctl connect "$device_mac"
    fi
fi

# Убираем разрешение на доступ к дисплею после завершения
xhost -SI:localuser:$(whoami) >/dev/null 2>&1

