require "test_helper"

class ExpenseTest < ActiveSupport::TestCase
  test "should not save expense without amount" do
    expense = Expense.new
    assert_not expense.save, "Saved the expense without an amount"
  end

  test "should not save expense with negative amount" do
    expense = Expense.new
    expense.amount = -1
    assert_not expense.save, "Saved the expense with a negative amount"
  end

  test "should not save expense without date" do
    expense = Expense.new
    expense.date = nil
    assert_not expense.save, "Saved the expense without a date"
  end
end
