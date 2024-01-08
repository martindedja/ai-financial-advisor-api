class AddDateToIncomes < ActiveRecord::Migration[7.1]
  def change
    add_column :income, :date, :date
  end
end
