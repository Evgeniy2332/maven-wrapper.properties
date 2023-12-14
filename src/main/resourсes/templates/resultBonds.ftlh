<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Результаты поиска</title>
    <style>
                    /* Общий стиль для всего сайта. */
                    body {
                        background: #f4f4f4;
                        font-family: 'Arial', sans-serif;
                        color: #333;
                        text-align: center;
                        font-size: 18px;
                        padding: 20px;
                    }

                    /* Стиль для контейнера с информацией. */
                    .info-container, .form_container, .table_container {
                        background-color: #fff;
                        border: 1px solid #ddd;
                        border-radius: 10px;
                        padding: 20px;
                        margin: 20px;
                        box-shadow: 0px 2px 16px rgb(0 0 0 / 10%);
                    }

                    /* Стили для ссылок */
                    a {
                        color: #3498db;
                        text-decoration: none;
                    }

                    a:hover {
                        color: #2980b9;
                    }

                    /* Стиль для заголовков внутри контейнера. */
                    .info-container h1, .info-container h2, .info-container h3 {
                        color: #2c3e50;
                    }

                    /* Стиль для абзацев внутри контейнера. */
                    .info-container p {
                        color: #777;
                        line-height: 1.6;
                    }

                    /* Стили для кнопок */
                    .btn {
                        display: inline-block;
                        background: #3498db;
                        color: #fff;
                        padding: 10px 20px;
                        border-radius: 5px;
                        transition: opacity .3s;
                        text-decoration: none;
                    }

                    .btn:hover {
                        opacity: 0.7;
                    }

                    /* Стили для таблицы. */
                    table {
                        border-collapse: collapse;
                        margin: auto;
                        width: 80%;
                        border: 1px solid #ddd;
                    }

                    th, td {
                        text-align: left;
                        padding: 15px;
                        color: #333;
                    }

                    th {
                        background-color: #f4f4f4;
                        color: #333;
                    }

                    tr:nth-child(even) {
                        background-color: #fafafa;
                    }

                    tr:hover {
                        background-color: #f4f4f4;
                    }
        </style>

</head>
<body>
    <h1>Данные по облигациям</h1>
    <div class="form_container">
    <p>
    <!-- Добавляем форму для поиска и кнопку -->
        <form id="searchForm" action="/resultBonds" method="get">
            <label for="columnIndex">Выберите столбец для поиска: </label>
            <select id="columnIndex" name="columnIndex">
                <option value="0">Название</option>
                <option value="1">Доходность к погашению</option>
                <option value="2">Цена в % от номинала</option>
                <option value="3">Размер купона</option>
                <option value="4">Купонный период</option>
                <option value="5">Дюрация</option>
                <option value="6">Кредитный рейтинг</option>
                <option value="7">Тип купона</option>
                <option value="8">Валюта</option>
            </select>
            <br>
            <label for="filterValue">Введите текст для поиска: </label>
            <input type="text" id="filterValue" name="filterValue" placeholder="Введите текст для поиска">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit">Поиск</button>
        </form>
    </p><br>

    <form action="/filter" method="post">
            <label for="columnIndex">Индекс колонки:</label><br>
            <input type="number" id="columnIndex" name="columnIndex"><br>

            <label for="minFilterValue">Минимальное значение:</label><br>
            <input type="number" step="0.01" id="minFilterValue" name="minFilterValue"><br>

            <label for="maxFilterValue">Максимальное значение:</label><br>
            <input type="number" step="0.01" id="maxFilterValue" name="maxFilterValue"><br>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="Найти">
        </form><br>
        </div>
        <br><p><a href="/searchResultTab" class="btn">Анализ акций</a></p><br>

        <div class="table_container">
    <table id="bondsTable" style="border-collapse: collapse; width: 100%;">
        <thead>
            <tr>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(0)">Название</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(1)">Доходность к погашению</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(2)">Цена в % от номинала</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(3)">Размер купона</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(4)">Купонный период</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(5)">Дюрация</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(6)">Кредитный рейтинг</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(7)">Тип купона</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(8)">Валюта</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(9)">ISIN</th>
            </tr>
        </thead>
        <tbody>
            <#list infoBonds as item>
                <tr>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.name?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.priceReturn?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.price?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.couponvalue?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.couponperiod?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.duration?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.creditRatingText?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.couponType?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.currency?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${item.isin?if_exists}</td>
                </tr>
            </#list>
        </tbody>
    </table>
    </div>

    <script>
        let ascending = true; // По умолчанию сортировка по возрастанию

        function sortTable(columnIndex) {
            const table = document.getElementById('bondsTable');
            const tbody = table.querySelector('tbody');
            const rows = Array.from(tbody.querySelectorAll('tr'));

            rows.sort((a, b) => {
                let cellA = a.querySelectorAll('td')[columnIndex].textContent;
                let cellB = b.querySelectorAll('td')[columnIndex].textContent;

                // корректировка если ячейка пустая или NaN
                if (!cellA || isNaN(cellA)) cellA = cellA ? cellA : '';
                if (!cellB || isNaN(cellB)) cellB = cellB ? cellB : '';

                // Выбираем способ сортировки в зависимости от порядка
                return ascending ?
                    cellA.localeCompare(cellB, undefined, { numeric: true }) :
                    cellB.localeCompare(cellA, undefined, { numeric: true });
            });

            // Удаляем существующие строки
            rows.forEach(row => tbody.removeChild(row));

            // Добавляем отсортированные строки обратно в таблицу
            rows.forEach(row => tbody.appendChild(row));

            // Инвертируем порядок сортировки
            ascending = !ascending;
        }
    </script>

    <script>
            // Обработка отправки формы поиска
            document.querySelector('#searchForm').addEventListener('submit', function (event) {
                event.preventDefault(); // Предотвратить отправку формы
                const columnIndex = document.getElementById('columnIndex').value;
                const filterValue = document.getElementById('filterValue').value;

                // Перенаправление на URL с параметрами поиска
                window.location.href = `/resultBonds?columnIndex=${columnIndex}&filterValue=${filterValue}`;
            });
        </script>
</body>
</html>