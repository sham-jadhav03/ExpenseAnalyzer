<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Expense - Personal Expense Analyzer</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Personal Expense Analyzer</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/viewExpenses">View Expenses</a>
            <a href="${pageContext.request.contextPath}/addExpense">Add Expense</a>
            <a href="${pageContext.request.contextPath}/summary">Spending Summary</a>
        </nav>

        <h2>Add New Expense</h2>
        <form action="${pageContext.request.contextPath}/saveExpense" method="post">
            <div class="form-group">
                <label for="amount">Amount (₹):</label>
                <input type="number" step="0.01" id="amount" name="amount" required>
            </div>
            
            <div class="form-group">
                <label for="category">Category (Leave empty for auto-detection):</label>
                <input type="text" id="category" name="category" placeholder="E.g. Food, Travel, Entertainment">
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" placeholder="E.g. Pizza, Bus ticket, Shopping" required>
            </div>

            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required value="<%= java.time.LocalDate.now() %>">
            </div>

            <div style="text-align: center; margin-top: 30px;">
                <button type="submit" class="btn btn-add" style="width: 200px;">Save Expense</button>
            </div>
        </form>
    </div>
</body>
</html>
