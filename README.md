# HW3

## Из чего состоит (суть)

Два контейнера: 1-ый генерирует csv с данными о сотрудниках, 2-ой делает из этого html-отчёт

## Запуск

По очереди в терминале:
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
После этого в папке data будут data.csv и report.html

## Какие есть команды

build_generator и run_generator - собрать и запустить генератор
build_reporter и run_reporter - собрать и запустить аналитика
structure - показать структуру проекта
clear_data - очистить папку data
inside_generator и inside_reporter - посмотреть содержимое data изнутри контейнера
create_local_data - запустить генератор локально

## Проверка

Открыть report.html в браузере или выполнить:
head -10 data/report.html