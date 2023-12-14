<!DOCTYPE html>
<html>
<head>
    <title>Результаты</title>
    <style>
            body {
                background: linear-gradient(to right, #FFFFFF, #50C878);
                color: black; /* Черный цвет текста для всего текста внутри body */
                text-align: center;
                font-size: 24px;
                padding: 50px;
            }

            h1 {
                font-family: 'Arial', sans-serif;
                font-size: 36px;
                font-weight: bold;
                text-transform: uppercase;
                text-decoration: underline;
            }

            h2 {
                font-family: 'Arial', sans-serif;
                font-size: 36px;
                font-weight: bold;
                text-transform: uppercase;
                text-decoration: underline;
            }

            .info-container {
                background-color: #34495e;
                border: 1px solid #ccc;
                padding: 20px;
                margin: 20px;
                border-radius: 10px;
            }

            p {
                font-size: 18px;
                margin-bottom: 10px;
            }

            ul li {
                color: black; /* Черный цвет текста элементов списка */
            }

            li {
                font-size: 18px;
                text-align: left;
                margin-bottom: 10px;
            }

            /* Стили для форм и кнопок */
            form {
                margin-top: 20px;
            }

            label, input, select, button {
                font-size: 18px;
            }
        </style>
</head>
<body>
    <h1>Результат запроса</h1>
    <!-- Добавляем форму для поиска и кнопку -->
    <form action="/search" method="post">
            <label for="searchText">Поиск: </label>
            <input type="text" id="searchText" name="searchText" placeholder="Введите текст для поиска">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit">Найти</button>
        </form>


       <form action="/search/sector" method="post">
       <label for="selectedSector">Выберите сектор:</label>
       <select id="selectedSector" name="sector">
           <option value="Finance">Finance</option>
           <option value="Retail Trade">Retail Trade</option>
           <option value="Process Industries">Process Industries</option>
           <option value="Transportation">Transportation</option>
           <option value="Distribution Services">Distribution Services</option>
           <option value="Non-Energy Minerals">Non-Energy Minerals</option>
           <option value="Communications">Communications</option>
           <option value="Utilities">Utilities</option>
           <option value="Technology Services">Technology Services</option>
           <option value="Consumer Durables">Consumer Durables</option>
           <option value="Health Technology">Health Technology</option>
           <option value="Energy Minerals">Energy Minerals</option>
       </select>
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
       <button type="submit">Найти</button>
        </form>
    <form action="/searchFirstTen" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" name="buttonName">Десять акций с наименьшим дневным RSI</button>
    </form>

    <form action="/searchLastTen" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" name="buttonName">Десять акций с наибольшим дневным RSI</button>
        </form>
    <h2>АНАЛИЗ АКЦИЙ:</h2>
    <ul>
        <#list infoDay as item>
            <li>${item}</li>
        </#list>
    </ul>

</body>
</html>