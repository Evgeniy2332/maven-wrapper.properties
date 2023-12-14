<!DOCTYPE html>
<html>
<head>
    <title>Результаты</title>
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
                .info-container {
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
    <h1>Данные по акциям ${marketName}</h1>
            <p><a href="/searchResultTab">Показать все акции</a></p>

            <!-- Форма поиска с красивыми рамками, цветами и тенями. -->
            <form id="searchForm" action="/searchResultTab" method="get">
                <label for="searchKey">Поиск:</label><br/>
                <input type="text" id="searchKey" name="searchKey"><br/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="btn" type="submit" value="Получить данные">
            </form><br/>

            <!-- Форма выбора рынка с красивыми рамками, цветами и тенями. -->
            <form id="marketForm" action="/searchResultTab" method="get">
                <label for="market">Выберите рынок:</label><br>
                <select id="market" name="market">
                    <option value="russia">Россия</option>
                    <option value="america">Америка</option>
                </select>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="btn" type="submit" value="Получить данные">
            </form><br/>

    <table id="stockTable" style="border-collapse: collapse; width: 100%;">
        <thead>
            <tr>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(0)">Тикер</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(1)">Полное название</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(2)">Цена</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(3)">RSI  (D)</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(4)">RSI  (W)</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(5)">RSI  (M)</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(6)">Сигнал MACD</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(7)">Уровень MACD</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(8)">Изменение YTD %</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(9)">Изменение за год %</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(10)">Изменение за месяц %</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(11)">Изменение за неделю %</th>
                <th style="border: 1px solid #808080; padding: 8px; cursor: pointer;" onclick="sortTable(12)">Сектор</th>
                <!-- и так далее для каждого поля класса StockData -->
            </tr>
        </thead>
        <tbody>
            <#list stocks as stock>
                <tr>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.tiker?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.fullName?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.price?if_exists}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.indRsiD?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.indRsiW?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.indRsiM?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.signalMacd?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.urovenMacd?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.izmYTD?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.izmYear?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.izmMonth?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.izmWeek?if_exists?string("0.##")}</td>
                    <td style="border: 1px solid #808080; padding: 8px;">${stock.sector?if_exists}</td>
                    <!-- и так далее для каждого поля класса StockData -->
                </tr>
            </#list>
        </tbody>
    </table>
    <script>
        let sortDirection = 1;
        let filteredRows = [];

        function sortTable(columnIndex) {
            const table = document.getElementById('stockTable');
            const tbody = table.querySelector('tbody');
            let rows = filteredRows.length > 0 ? filteredRows : Array.from(tbody.querySelectorAll('tr'));

            rows.sort((a, b) => {
                const cellA = a.querySelectorAll('td')[columnIndex].textContent;
                const cellB = b.querySelectorAll('td')[columnIndex].textContent;

                if (sortDirection === 1) {
                    return cellA.localeCompare(cellB, undefined, { numeric: true });
                } else {
                    return cellB.localeCompare(cellA, undefined, { numeric: true });
                }
            });

            tbody.innerHTML = '';

            // Adding sorted rows back into the table
            rows.forEach(row => tbody.appendChild(row));

            // Toggle sorting direction
            sortDirection *= -1;
        }

        const searchForm = document.getElementById('searchForm');
        const searchKey = document.getElementById('searchKey');

        const stockTable = document.getElementById('stockTable');

        searchForm.addEventListener('submit', function(event) {
            event.preventDefault();

            const searchValue = searchKey.value.toUpperCase();

            // Empty filteredRows array
            filteredRows.length = 0;

            for (const row of stockTable.querySelectorAll('tr')) {
                let text = row.textContent.toUpperCase();
                if (text.includes(searchValue)) {
                    filteredRows.push(row);
                }
            }

            // Clear table body
            const tbody = stockTable.querySelector('tbody');
            tbody.innerHTML = '';

            // Add filtered Rows to the table
            filteredRows.forEach(row => tbody.appendChild(row));
        });
    </script>
        <script>
            // Получите форму поиска и её элемент ввода
            const searchForm = document.getElementById('searchForm');
            const searchKey = document.getElementById('searchKey');

            // Получите таблицу
            const stockTable = document.getElementById('stockTable');

            // Добавьте обработчик событий для формы поиска
            searchForm.addEventListener('submit', function(event) {
                // Предотвращаем стандартное действие формы
                event.preventDefault();

                // Получите значение поиска
                const searchValue = searchKey.value.toUpperCase();

                // Пройдитесь по каждой строке в таблице
                for (const row of stockTable.querySelectorAll('tr')) {
                    let text = row.textContent.toUpperCase();  // Получите текст в строке
                    row.style.display = text.includes(searchValue) ? '' : 'none';  // Если текст в строке содержит строку поиска, отобразите строку, иначе скройте её
                }
            });
        </script>

</body>
</html>