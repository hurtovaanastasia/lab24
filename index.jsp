<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Калькулятор</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            padding: 40px;
            display: flex;
            justify-content: center;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 400px;
        }
        h2 {
            margin-top: 0;
            color: #333;
            text-align: center;
        }
        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .result {
            margin-top: 20px;
            padding: 15px;
            background-color: #e9ffe9;
            border-left: 5px solid #28a745;
            border-radius: 5px;
            color: #155724;
        }
        .error {
            margin-top: 20px;
            padding: 15px;
            background-color: #ffe9e9;
            border-left: 5px solid #dc3545;
            border-radius: 5px;
            color: #721c24;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Калькулятор</h2>

    <%
        String xParam = request.getParameter("x");
        String nParam = request.getParameter("n");
        if (xParam != null && nParam != null) {
            try {
                double x = Double.parseDouble(xParam);
                double n = Double.parseDouble(nParam);
                if (Math.abs(x) >= 1 || n <= 0) {
    %>
        <div class="error">Нельзя использовать эти значения.</div>
    <%
                } else {
                    double sum = 0;
                    double res = 1;
                    for (double i = 1; i < n; i++) {
                        double up = 1;
                        double down = 1;
                        for (double j = 1; j < i; j++) {
                            up = (2 * j - 1) * Math.pow(x, 2 * j - 1);
                        }
                        for (double k = 1; k < i; k++) {
                            down = (2 * k) * (2 * k + 1);
                        }
                        res = up / down;
                    }
                    sum += res;
                    double count = (Math.PI / 2) - (x + sum);
    %>
        <div class="result">Результат: <strong><%= count %></strong></div>
    <%
                }
            } catch (NumberFormatException e) {
    %>
        <div class="error">Некорректный ввод. Введите числовое значение.</div>
    <%
            }
        }
    %>

    <form method="get">
        <label for="x">Введите "x"(от -1 до 1):</label>
        <input type="text" name="x" id="x" required />

        <label for="n">Введите количество циклов(от 0 и более):</label>
        <input type="number" name="n" id="n" required min="1" />

        <input type="submit" value="Просчитать" />
    </form>
</div>
</body>
</html>
