<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Калькулятор</title>
</head>
<body>
<%
    String xParam = request.getParameter("x");
    String nParam = request.getParameter("n");

    if (xParam != null && nParam != null) {
        try {
            double x = Double.parseDouble(xParam);
            int n = Integer.parseInt(nParam);

            if (Math.abs(x) >= 1 || n <= 0) {
%>
                <p>Нельзя использовать эти данные.</p>
<%
            } else {
                double sum = 0;

                for (int i = 1; i <= n; i++) {
                    double numerator = Math.pow(x, 2 * i - 1);
                    int denominator = (2 * i) * (2 * i + 1);
                    sum += numerator / denominator;
                }

                double result = (Math.PI / 2) - (x + sum);
%>
                <p>Результат: <%= result %></p>
<%
            }
        } catch (NumberFormatException e) {
%>
            <p>Некорректный ввод.</p>
<%
        }
    }
%>

<form>
    <label>Введите x (|x| &lt; 1):</label>
    <input type="text" name="x" required />
    <br/>
    <label>Введите количество повторений (n &gt; 0):</label>
    <input type="text" name="n" required />
    <br/>
    <input type="submit" value="Посчитать"/>
</form>
</body>
</html>

