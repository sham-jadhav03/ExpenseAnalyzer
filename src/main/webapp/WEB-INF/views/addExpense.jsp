<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Expense - Personal Expense Analyzer</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Personal Expense Analyzer</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/add">Add Expense</a>
            <a href="${pageContext.request.contextPath}/view">View Expenses</a>
            <a href="${pageContext.request.contextPath}/summary">Spending Summary</a>
        </nav>
        
        <h2>Add New Expense</h2>
        <form:form action="${pageContext.request.contextPath}/save" method="post" modelAttribute="expense">
            <label for="amount">Amount (₹):</label>
            <form:input path="amount" type="number" step="0.01" required="true" placeholder="Enter amount" />
            
            <label for="category">Category (Leave empty for auto):</label>
            <form:input path="category" placeholder="e.g. Food, Travel, etc." />
            
            <label for="description">Description:</label>
            <form:input path="description" required="true" placeholder="e.g. Pizza, Bus ticket" />
            
            <label for="date">Date:</label>
            <form:input path="date" type="date" required="true" />
            
            <div style="margin-top: 20px;">
                <button type="submit" class="btn btn-add">Save Expense</button>
            </div>
        </form:form>
    </div>
</body>
</html>
