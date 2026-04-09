<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Expenses - Personal Expense Analyzer</title>
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
        
        <h2>All Stored Expenses</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Amount</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="expense" items="${expenses}">
                    <tr>
                        <td>${expense.id}</td>
                        <td>₹${expense.amount}</td>
                        <td>${expense.category}</td>
                        <td>${expense.description}</td>
                        <td>${expense.date}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/delete/${expense.id}" 
                               class="btn btn-delete" 
                               onclick="return confirm('Are you sure you want to delete this expense?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty expenses}">
                    <tr>
                        <td colspan="6" style="text-align:center;">No expenses recorded yet.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
