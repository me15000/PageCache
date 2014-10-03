<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=DateTime.Now.ToString() %></title>
</head>
<body>
    now:<%=DateTime.Now.ToString() %><br />
    querystring id:<%=Request.QueryString["id"] %><br />

    header id:<%=Request.Headers["idheader"] %><br />

    user-Agent:<%=Request.UserAgent %>
</body>
</html>
