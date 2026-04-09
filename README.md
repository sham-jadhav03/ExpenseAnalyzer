# Personal Expense Analyzer

A simple, Java-based web application for tracking daily expenses, built with Spring MVC, Hibernate, and JSP.

## 🚀 Overview
The **Personal Expense Analyzer** helps users record their daily spending, view expense history, and generate simple insights. It features auto-categorization and rule-based saving suggestions to help users manage their finances better.

---

## 🛠 Features
- **Add Expense**: Record amount, category, description, and date.
- **Auto-Categorization**: Automatically assigns categories based on keywords in the description (e.g., "pizza" → Food, "bus" → Travel).
- **View Expenses**: A complete tabular view of all recorded expenses with delete functionality.
- **Spending Insights**:
    - Total monthly expense calculation.
    - Category-wise spending breakdown.
    - Smart saving suggestions (e.g., high food spending alerts).
- **Clean UI**: Simple, responsive design using Vanilla CSS.

---

## 💻 Tech Stack
- **Backend**: Java 17+, Spring Framework 6 (MVC), Hibernate 6 (ORM).
- **Frontend**: JSP, HTML, CSS (Vanilla).
- **Database**: MySQL.
- **Server**: Apache Tomcat 10+ (Jakarta EE).
- **Build Tool**: Maven.

---

## ⚙️ How to Run on Local Machine

### 1. Prerequisites
Ensure you have the following installed:
- **Java Development Kit (JDK 17 or higher)**
- **Apache Maven**
- **MySQL Server**
- **Apache Tomcat 10.x**

### 2. Database Setup
1. Open your MySQL client (e.g., MySQL Workbench or Command Line).
2. Run the SQL script located in `db/schema.sql` to create the database and the required tables.
   ```sql
   -- This will create 'expense_db' and the 'expenses' table
   ```

### 3. Project Configuration
1. Open the project in your IDE (IntelliJ, Eclipse, or VS Code).
2. Locate `src/main/java/com/expense/config/AppConfig.java`.
3. Update the database credentials on lines 45-46 if they differ from your setup:
   ```java
   dataSource.setUsername("root");
   dataSource.setPassword("your_password"); // Ensure this matches your MySQL password
   ```

### 4. Build the Project
Open a terminal in the project root directory and run:
```bash
mvn clean package
```
This will generate an `expense.war` file in the `target/` directory.

### 5. Deploy to Tomcat
1. Copy the `expense.war` file from the `target/` folder.
2. Paste it into the `webapps/` folder of your Tomcat installation.
3. Start the Tomcat server.
4. Access the application in your browser at:
   `http://localhost:8080/expense/`

---

## 📂 Project Structure
```text
PersonalExpenseAnalyzer/
├── src/main/java/com/expense/
│   ├── config/      # Spring & Hibernate Configurations
│   ├── controller/  # Web Mappings & Business Logic
│   ├── dao/         # Data Access Objects (Hibernate)
│   └── model/       # JPA Entities (Expense)
├── src/main/webapp/
│   ├── WEB-INF/views/ # JSP Pages
│   └── static/css/    # Stylesheets
├── db/              # SQL Database Scripts
└── pom.xml          # Maven Dependencies
```

---

## 📜 License
This project is for academic/mini-project purposes.
