#!/bin/sh

# Получаем текущее время с наносекундами и записываем его в файл
python3 -c "import datetime; print(datetime.datetime.now().strftime('%s.%f'))" > /root/result
sleep 7
