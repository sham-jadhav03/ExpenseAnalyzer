<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Expenses - Personal Expense Analyzer</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <aside class="sidebar">
        <a href="${pageContext.request.contextPath}/add" class="sidebar-brand">
            <i data-lucide="zap" style="fill: var(--primary);"></i>
            Expensify
        </a>
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/add" class="sidebar-link">
                <i data-lucide="layout-dashboard"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/view" class="sidebar-link active">
                <i data-lucide="layers"></i> History
            </a>
            <a href="${pageContext.request.contextPath}/summary" class="sidebar-link">
                <i data-lucide="bar-chart-2"></i> Analytics
            </a>
            <a href="#" class="sidebar-link">
                <i data-lucide="settings"></i> Settings
            </a>
        </nav>
    </aside>

    <main class="main-wrapper">
        <header class="top-bar">
            <div class="user-profile">
                <span style="color: var(--text-muted); font-size: 0.9rem; margin-right: 8px;">Notifications</span>
                <i data-lucide="bell" style="width: 20px; color: var(--text-muted); margin-right: 24px;"></i>
                <span>Sarah J.</span>
                <div class="user-avatar"></div>
            </div>
        </header>

        <section>
            <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 32px;">
                <div>
                    <h1>Expense History</h1>
                    <p style="color: var(--text-muted); margin-top: 8px;">Track and manage all your recent expenditures</p>
                </div>
                <a href="${pageContext.request.contextPath}/add" class="btn btn-primary">
                    <i data-lucide="plus"></i> Add New Expense
                </a>
            </div>

            <div class="glass-panel" style="padding: 0; overflow: hidden;">
                <div style="padding: 24px; border-bottom: 1px solid var(--glass-border); display: flex; align-items: center; gap: 12px;">
                    <i data-lucide="search" style="color: var(--text-muted); width: 20px;"></i>
                    <input type="text" placeholder="Search transactions..." style="background: none; border: none; color: #fff; outline: none; width: 100%;">
                </div>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th>Amount</th>
                            <th style="text-align: right;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="expense" items="${expenses}">
                            <tr>
                                <td style="color: var(--text-muted); font-size: 0.9rem;">${expense.date}</td>
                                <td style="font-weight: 500;">${expense.description}</td>
                                <td>
                                    <span class="pill" style="color: var(--primary); background: rgba(45, 212, 191, 0.1); border: 1px solid rgba(45, 212, 191, 0.2);">
                                        ${expense.category}
                                    </span>
                                </td>
                                <td style="font-weight: 700; font-size: 1.1rem;">₹${expense.amount}</td>
                                <td style="text-align: right;">
                                    <a href="${pageContext.request.contextPath}/delete/${expense.id}" 
                                       class="btn btn-outline-danger" 
                                       style="padding: 8px 12px; font-size: 0.8rem;"
                                       onclick="return confirm('Are you sure you want to delete this expense?')">
                                        <i data-lucide="trash-2" style="width: 14px;"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty expenses}">
                            <tr>
                                <td colspan="5" style="text-align:center; padding: 80px; color: var(--text-muted);">
                                    <i data-lucide="inbox" style="width: 48px; height: 48px; opacity: 0.2; margin-bottom: 16px;"></i>
                                    <p>No expenses recorded yet.</p>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </section>
    </main>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
