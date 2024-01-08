
# AI Financial Advisor API

Welcome to the AI Financial Advisor API, built on Ruby on Rails. This API serves as the backend for the AI Financial Advisor, a tool designed to provide intelligent financial guidance.

## Getting Started

Follow these instructions to get your copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have the following installed:

- Ruby
- Rails
- PostgreSQL

### Installation

1. **Clone the Repository**

   Start by cloning the repository to your local machine:

   ```bash
   git clone https://github.com/martindedja/ai-financial-advisor-api.git
   ```

2. **Install Dependencies**

   Navigate to the project directory and install the required gems:

   ```bash
   cd ai-financial-advisor-api
   bundle install
   ```

3. **Database Setup**

   There is a copy of the database.sql on ./database.sql

   Start the PostgreSQL service:

   ```bash
   sudo service postgresql restart
   ```

   Then, create and migrate your database:

   ```bash
   rails db:create db:migrate
   ```

4. **Start the Rails Server**

   To start the Rails server, run:

   ```bash
   rails server
   ```

   Your API will now be running on `http://localhost:3000`.

## Usage

Detailed API documentation on how to use the endpoints will be provided separately.

## Contributing

We welcome contributions to this project. Please follow the standard git workflow - fork, clone, branch, commit, push, and pull request.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
