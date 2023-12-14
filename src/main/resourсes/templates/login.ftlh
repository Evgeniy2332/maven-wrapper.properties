<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
    body {
                background: linear-gradient(to right, #FFFFFF, #50C878);
                color: #ffffff;
                text-align: center;
                font-size: 24px;
                padding: 100px;
            }
    </style>
</head>
<body>

<h1>Авторизация</h1>
<form action="/login" method="post">
<p>
  Эл.почта: <input type="email" name="username"><br>
</p>
<p>
  Пароль: <input type="password" name="password"><br>
  <input type="hidden" name="_csrf" value="${_csrf.token}">
</p>
  <input type="submit" value="Вход"/>
  </form>
  <p>
<a href="/registration">Зарегистрироваться</a>
</p>
</body>
</html>