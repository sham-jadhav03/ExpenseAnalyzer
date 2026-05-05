<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spending Summary - Personal Expense Analyzer</title>
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
            <a href="${pageContext.request.contextPath}/view" class="sidebar-link">
                <i data-lucide="layers"></i> History
            </a>
            <a href="${pageContext.request.contextPath}/summary" class="sidebar-link active">
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
            <h1>Financial Analytics</h1>
            <p style="color: var(--text-muted); margin-top: 8px; margin-bottom: 32px;">Overview of your monthly spending patterns</p>

            <div class="stats-grid">
                <div class="stat-card" style="grid-column: span 2; display: flex; justify-content: space-between; align-items: center; background: linear-gradient(135deg, rgba(45, 212, 191, 0.1) 0%, rgba(124, 58, 237, 0.1) 100%);">
                    <div>
                        <h3 style="color: var(--text-muted); font-size: 0.9rem; text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 12px;">Monthly Total</h3>
                        <p class="total-amount">₹${monthlyTotal}</p>
                    </div>
                    <i data-lucide="trending-up" style="width: 64px; height: 64px; color: var(--primary); opacity: 0.3;"></i>
                </div>

                <div class="glass-panel" style="padding: 32px;">
                    <h3 style="margin-bottom: 24px;"><i data-lucide="pie-chart" style="width: 20px; vertical-align: middle; margin-right: 8px; color: var(--primary);"></i> Category Breakdown</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Category</th>
                                <th style="text-align: right;">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="entry" items="${categoryTotals}">
                                <tr>
                                    <td><span style="font-weight: 600;">${entry.key}</span></td>
                                    <td style="text-align: right; font-weight: 700; color: var(--primary);">₹${entry.value}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty categoryTotals}">
                                <tr>
                                    <td colspan="2" style="text-align:center; padding: 20px; color: var(--text-muted);">No data.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <div class="glass-panel" style="padding: 32px;">
                    <h3 style="margin-bottom: 24px;"><i data-lucide="sparkles" style="width: 20px; vertical-align: middle; margin-right: 8px; color: var(--primary);"></i> Smart Insights</h3>
                    <c:if test="${not empty generalSuggestion}">
                        <div class="suggestion" style="background: rgba(245, 158, 11, 0.05); border-left: 4px solid #f59e0b; padding: 20px; border-radius: 12px; margin-bottom: 16px;">
                            ${generalSuggestion}
                        </div>
                    </c:if>
                    <c:if test="${not empty foodSuggestion}">
                        <div class="suggestion" style="background: rgba(245, 158, 11, 0.05); border-left: 4px solid #f59e0b; padding: 20px; border-radius: 12px;">
                            ${foodSuggestion}
                        </div>
                    </c:if>
                    <c:if test="${empty generalSuggestion and empty foodSuggestion}">
                        <div style="text-align: center; padding: 40px;">
                            <i data-lucide="shield-check" style="width: 48px; height: 48px; color: var(--success); opacity: 0.4; margin-bottom: 16px;"></i>
                            <p style="color: var(--text-muted);">Everything looks great!</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
    </main>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
