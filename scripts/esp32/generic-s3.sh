#!/bin/bash

#  This file is part of the micropython-builder project,
#  https://github.com/v923z/micropython-builder
#  The MIT License (MIT)
#  Copyright (c) 2022-2023 Zoltán Vörös
#                2023 Zach Moshe

source ./scripts/esp32/esp32.sh

# 1. 在编译前，直接用 echo 强行在你云端拉下来的 mpconfigboard.h 里追加关闭 PSRAM 的宏定义！
# 这样既能完美使用官方的配置目录，又能从底层彻底阉割掉检测 PSRAM 的代码！
echo "#define MICROPY_HW_PSRAM_ENABLE (0)" >> ./micropython/ports/esp32/boards/ESP32_GENERIC_S3/mpconfigboard.h

build_esp32 "ESP32_GENERIC_S3"
