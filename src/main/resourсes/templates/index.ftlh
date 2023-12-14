<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Название вашего сайта</title>
    <link rel="stylesheet" href="styles.css"> <!-- Подключите ваши стили CSS, если есть -->
    <style>
            /* Добавьте стили CSS здесь, если это необходимо */
            body {
                background: linear-gradient(to right, #90EE90, #008000);
                color: #black;
                text-align: center;
                font-size: 24px;
                padding: 100px;
            }
            ul {
                list-style-type: none; /* Убираем маркеры списка */
                padding-left: 0; /* Убираем отступ слева у списка */
            }

            /* Добавим отступ и стили для элементов списка */
            ul li {
                margin-left: 20px; /* Устанавливаем отступ слева для элементов списка */
                font-size: 18px;
                color: black; /* Черный цвет текста элементов списка */
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

            p {
                font-size: 18px;
                color: #333;
                margin-bottom: 10px;
            }
            h1 {
                            font-family: 'Arial', sans-serif;
                            font-size: 36px;
                            font-weight: bold;
                            text-transform: uppercase;
                            text-decoration: underline;
                        }


            h2 {
                display: inline-block;
                margin-right: 20px;
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
                                text-decoration: underline; /* Добавьте подчеркивание текста */
                                margin-top: 5px; /* Отступ сверху, чтобы разделить ссылки */
            a:hover {
            color: yellow;
            }

            /* Стили для надписи "Регистрация" */
            .top-right-links a:last-child {
                color: black; /* Установите черный цвет текста */
                text-decoration: underline; /* Добавьте подчеркивание текста */
                margin-top: 5px; /* Отступ сверху, чтобы разделить ссылки */
                a:hover {
                color: yellow;
            }
        </style>
</head>
<body>
    <header>
        <h1>Добро пожаловать на сайт</h1>
        <nav>
            <ul>
                <li><a href="/">Главная</a></li>
                <li><a href="/about">О нас</a></li>
                <li><a href="/stats">Статистика рынка</a></li>
                <li><a href="/contact">Контакты</a></li>
            </ul>
        </nav>
    </header>

    <main>

        <section>
            <div class="top-right-links">
                <a href="/account" class="btn btn-primary">Личный кабинет</a>
                <a href="/register" class="btn btn-primary">Регистрация</a>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2023 Название вашей компании. Все права защищены.</p>
    </footer>
</body>
</html>