<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spending Summary - Personal Expense Analyzer</title>
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
        
        <h2>Spending Insights</h2>
        
        <div class="summary-card">
            <h3>Monthly Total</h3>
            <p style="font-size: 24px; font-weight: bold; color: #007bff;">Total Expense This Month: ₹${monthlyTotal}</p>
        </div>

        <div class="summary-card">
            <h3>Category-wise Summary</h3>
            <table>
                <thead>
                    <tr>
                        <th>Category</th>
                        <th>Total Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="entry" items="${categoryTotals}">
                        <tr>
                            <td>${entry.key}</td>
                            <td>₹${entry.value}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty categoryTotals}">
                        <tr>
                            <td colspan="2" style="text-align:center;">No data available.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <div class="summary-card">
            <h3>Saving Suggestions</h3>
            <c:if test="${not empty generalSuggestion}">
                <div class="suggestion">${generalSuggestion}</div>
            </c:if>
            <c:if test="${not empty foodSuggestion}">
                <div class="suggestion">${foodSuggestion}</div>
            </c:if>
            <c:if test="${empty generalSuggestion and empty foodSuggestion}">
                <p>Your spending is within recommended limits. Keep it up!</p>
            </c:if>
        </div>
    </div>
</body>
</html>
