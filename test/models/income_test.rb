require "test_helper"

class IncomeTest < ActiveSupport::TestCase
  
  test "should not save income without amount" do
    income = Income.new
    assert_not income.save, "Saved the income without an amount"
  end

  test "should not save income with negative amount" do
    income = Income.new
    income.amount = -1
    assert_not income.save, "Saved the income with a negative amount"
  end

  test "should not save income without source" do
    income = Income.new
    income.source = nil
    assert_not income.save, "Saved the income without a source"
  end

  test "should not save income without date" do
    income = Income.new
    income.date = nil
    assert_not income.save, "Saved the income without a date"
  end

  test "should not save income without frequency" do
    income = Income.new
    income.frequency = nil
    assert_not income.save, "Saved the income without a frequency"
  end

end
