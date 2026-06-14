#!/bin/bash

case "$1" in
    build_generator)
        echo "Сборка образа для контейнера генератора"
        docker build -t generator ./generator
        echo "Готово"
        ;;
    run_generator)
        echo "Запуск контейнера, который сгенерирует data/data.csv локально"
        docker run --rm -v "$(pwd)/data:/data" generator
        echo "Готово"
        ;;
    build_reporter)
        echo "Сборка образа для контейнера аналитика"
        docker build -t reporter ./reporter
        echo "Готово"
        ;;
    run_reporter)
        echo "Запуск контейнера, который сгенерирует html отчет локально в директории data"
        docker run --rm -v "$(pwd)/data:/data" reporter
        echo "Готово"
        ;;
    structure)
        echo "Вывод структуры всех файлов и директорий проекта начиная с текущей папки"
        find . -type f -o -type d | grep -v ".git" | sort
        ;;
    clear_data)
        echo "Удаление всех сгенерированных данных — файлы .csv и .html из папки data/."
        rm -f data/*.csv
        rm -f data/*.html
        echo "Готово"
        ;;
    inside_generator)
        echo "Запуск контейнера генератора и вывод её содержимого data изнутри контейнера."
        docker run -v "$(pwd)/data:/data" generator /bin/sh -c "ls -la /data"
        ;;
    inside_reporter)
        echo "Запуск контейнера аналитика и вывод её содержимого data изнутри контейнера."
        docker run -v "$(pwd)/data:/data" reporter /bin/sh -c "ls -la /data"
        ;;
    create_local_data)
        echo "Создание data.csv в директории local_data (для локальной отладки)"
        mkdir -p local_data
        python3 ./generator/generate.py ./local_data
        echo "Готово"
        ;;
    *)
        echo "Неизвестная команда: $1"
        ;;
esac