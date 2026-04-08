<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Expenses - Personal Expense Analyzer</title>
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

        <h2>All Registered Expenses</h2>
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
                <c:forEach var="exp" items="${expenses}">
                    <tr>
                        <td>${exp.id}</td>
                        <td>₹${exp.amount}</td>
                        <td>${exp.category}</td>
                        <td>${exp.description}</td>
                        <td>${exp.date}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/delete/${exp.id}" 
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
        <div style="margin-top: 20px; text-align: right;">
            <a href="${pageContext.request.contextPath}/addExpense" class="btn btn-add">+ Add New Expense</a>
        </div>
    </div>
</body>
</html>
