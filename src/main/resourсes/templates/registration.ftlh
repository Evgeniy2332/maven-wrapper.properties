<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<h1>Регистрация</h1>
<form action="/registration" method="post">
  Имя пользователя:<input type="text" name="name"><br><br>
  Эл.почта: <input type="email" name="username"><br><br>
  Номер телефона: <input type="text" name="phoneNumber"><br>
  Пароль: <input type="password" name="password"><br>
  <input type="hidden" name="_csrf" value="${_csrf.token}">
  <input type="submit" value="Зарегистрироваться"/>
  </form>
<#if errorMessage??>
<h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>