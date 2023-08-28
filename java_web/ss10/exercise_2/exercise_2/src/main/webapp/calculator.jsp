<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="get">
    <fieldset>
        <legend>calculator</legend>
        <table>
            <tr>
                <td>
                    <label>firstOperand</label>
                </td>
                <td>
                    <input type="text" name="firstOperand">
                </td>
            </tr>
            <tr>
                <td>
                    <label>operator</label>
                </td>
                <td>
                    <select name="operator">
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label>secondOperand</label>
                </td>
                <td>
                    <input type="text" name="secondOperand">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Calculate">
                    <div>Result: <label name="${result}}"></label></div>
                </td>
            </tr>

        </table>
    </fieldset>
</form>
</body>
</html>
