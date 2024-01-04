CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password_hash VARCHAR(255),
    risk_tolerance INT,
    financial_goals VARCHAR(255)
);

CREATE TABLE Income (
    id INT PRIMARY KEY,
    user_id INT,
    source VARCHAR(255),
    amount DECIMAL(10, 2),
    frequency VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Expenses (
    id INT PRIMARY KEY,
    user_id INT,
    category VARCHAR(255),
    amount DECIMAL(10, 2),
    frequency VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Investments (
    id INT PRIMARY KEY,
    user_id INT,
    type VARCHAR(255),
    amount DECIMAL(10, 2),
    risk_level INT,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE RetirementAccounts (
    id INT PRIMARY KEY,
    user_id INT,
    account_type VARCHAR(255),
    balance DECIMAL(10, 2),
    contribution DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Debts (
    id INT PRIMARY KEY,
    user_id INT,
    type VARCHAR(255),
    amount DECIMAL(10, 2),
    interest_rate DECIMAL(5, 2),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE TaxInformation (
    id INT PRIMARY KEY,
    user_id INT,
    taxable_income DECIMAL(10, 2),
    deductions DECIMAL(10, 2),
    credits DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE CreditScore (
    id INT PRIMARY KEY,
    user_id INT,
    score INT,
    date_updated DATE,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE EducationalContent (
    id INT PRIMARY KEY,
    topic VARCHAR(255),
    content TEXT,
    personalized_for INT,
    FOREIGN KEY (personalized_for) REFERENCES Users(id)
);

CREATE TABLE ChatbotLogs (
    id INT PRIMARY KEY,
    user_id INT,
    query TEXT,
    response TEXT,
    timestamp TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Notifications (
    id INT PRIMARY KEY,
    user_id INT,
    type VARCHAR(255),
    message TEXT,
    date_sent TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE APIIntegrations (
    id INT PRIMARY KEY,
    user_id INT,
    service_name VARCHAR(255),
    access_token VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
