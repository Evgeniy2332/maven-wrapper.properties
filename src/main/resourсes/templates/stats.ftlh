<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Информация за период</title>
    <style>
        /* Добавьте стили CSS здесь, если это необходимо */
        body {
            background: linear-gradient(to right, #FFFFFF, #50C878);
            color: #ffffff;
            text-align: center;
            font-size: 24px;
            padding: 100px;
        }
        a {
                       color: black;
                       text-decoration: none; /* Убираем подчеркивание под ссылками */
                   }

                   /* Стили для ссылок при наведении курсора (если нужно изменить вид ссылки при наведении) */
                   a:hover {
                       color: yellow;
                       text-decoration: none; /* Убираем подчеркивание под ссылками */
                   }

        .info-container {
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
        }
         h1 {
                    color: black; /* Черный цвет текста */
                        font-family: 'Arial', sans-serif; /* Установите желаемый шрифт */
                        font-size: 36px; /* Установите размер шрифта */
                        font-weight: bold; /* Жирный текст */
                        text-transform: uppercase; /* Преобразование текста в верхний регистр */
                        text-decoration: underline; /* Подчеркнуть текст */
                }

        p {
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
        }


        h2 {
            display: inline-block;
            margin-right: 20px;
            font-family: 'Arial', sans-serif; /* Установите желаемый шрифт */
                font-size: 36px; /* Установите размер шрифта */
                font-weight: bold; /* Жирный текст */
                text-transform: uppercase; /* Преобразование текста в верхний регистр */
        }

        /* Стили для контейнера ссылок в правом верхнем углу */
        .top-right-links {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        /* Стили для надписи "Личный кабинет" */
        .top-right-links a:first-child {
            color: black; /* Установите черный цвет текста */
            font-style: italic; /* Сделайте текст курсивом */
        }

        /* Стили для надписи "Регистрация" */
        .top-right-links a:last-child {
            color: black; /* Установите черный цвет текста */
            text-decoration: underline; /* Добавьте подчеркивание текста */
            margin-top: 5px; /* Отступ сверху, чтобы разделить ссылки */
        }
    </style>
</head>
<body>
<div class="header-container">
    <h1>ВЫБОР ВИДА СТАТИСТИКИ</h1>
    <p>
    <h2>
    <form action="/getInfoDay" method="post">
    <a href="/resultDay" class="btn btn-primary">Статистика по рынку российских акций</a>
    </form>
    </h2>
    </p>
    <p>
    <h2>
    <a href="/resultBonds" class="btn btn-primary">Статистика по Российскому рынку облигаций</a>
    </h2>
    </p>
  </div>
</body>
</html>