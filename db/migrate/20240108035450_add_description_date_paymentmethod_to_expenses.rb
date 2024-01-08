class AddDescriptionDatePaymentmethodToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :description, :string
    add_column :expenses, :date, :date
    add_column :expenses, :payment_method, :string
  end
end
