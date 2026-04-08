<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spending Summary - Personal Expense Analyzer</title>
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

        <h2>Monthly Insight Summary</h2>
        
        <div class="summary-card">
            <h3>Total Expense This Month</h3>
            <p style="font-size: 24px; font-weight: bold; color: #3b82f6;">₹${monthlyTotal}</p>
        </div>

        <div class="summary-card">
            <h3>Category-wise Breakdown</h3>
            <c:if test="${not empty categorySummary}">
                <ul>
                    <c:forEach var="entry" items="${categorySummary}">
                        <li style="margin-bottom: 8px;">
                            <strong>${entry.key}:</strong> ₹${entry.value}
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test="${empty categorySummary}">
                <p>No data available for categories.</p>
            </c:if>
        </div>

        <c:if test="${not empty suggestions}">
            <div class="suggestion-box">
                <h3>Saving Suggestions</h3>
                <ul>
                    <c:forEach var="sug" items="${suggestions}">
                        <li>${sug}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
</body>
</html>
