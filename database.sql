CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password_hash VARCHAR(255),
    risk_tolerance INT,
    financial_goals VARCHAR(255)
);

CREATE TABLE Income (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    source VARCHAR(255),
    amount DECIMAL(10, 2),
    frequency VARCHAR(255)
);

CREATE TABLE Expenses (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    category VARCHAR(255),
    amount DECIMAL(10, 2),
    frequency VARCHAR(255)
);

CREATE TABLE Investments (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    type VARCHAR(255),
    amount DECIMAL(10, 2),
    risk_level INT
);

CREATE TABLE RetirementAccounts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    account_type VARCHAR(255),
    balance DECIMAL(10, 2),
    contribution DECIMAL(10, 2)
);

CREATE TABLE Debts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    type VARCHAR(255),
    amount DECIMAL(10, 2),
    interest_rate DECIMAL(5, 2)
);

CREATE TABLE TaxInformation (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    taxable_income DECIMAL(10, 2),
    deductions DECIMAL(10, 2),
    credits DECIMAL(10, 2)
);

CREATE TABLE CreditScore (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    score INT,
    date_updated DATE
);

CREATE TABLE EducationalContent (
    id SERIAL PRIMARY KEY,
    topic VARCHAR(255),
    content TEXT,
    personalized_for INT REFERENCES Users(id)
);

CREATE TABLE ChatbotLogs (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    query TEXT,
    response TEXT,
    timestamp TIMESTAMP
);

CREATE TABLE Notifications (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    type VARCHAR(255),
    message TEXT,
    date_sent TIMESTAMP
);

CREATE TABLE APIIntegrations (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    service_name VARCHAR(255),
    access_token VARCHAR(255)
);
