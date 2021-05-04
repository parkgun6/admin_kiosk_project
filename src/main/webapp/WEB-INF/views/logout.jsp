<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="/owner/logout">

	<input type='hidden' name="_csrf" value="${_csrf.token }">
	<button>LOGOUT</button>

</form>

</body>
</html>