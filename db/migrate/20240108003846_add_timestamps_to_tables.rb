class AddTimestampsToTables < ActiveRecord::Migration[7.1]
  def change
    table_names = [:users, :apiintegrations, :expenses, :income, :investments, :retirementaccounts, :debts, :taxinformation, :creditscore, :educationalcontent, :chatbotlogs, :notifications]
    table_names.each do |table_name|
      add_timestamps table_name, default: -> { 'CURRENT_TIMESTAMP' } unless column_exists?(table_name, :created_at)
    end
  end
end
