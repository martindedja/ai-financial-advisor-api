module Api
    class ExpensesController < ApplicationController
#sample expense
# amount: "1234"
# category: "Car"
# date: "2021-09-01"
# description: "1234"
# frequency: "One-Time"
# payment_method: "Credit Card"

        def index
            @expenses = Expense.all
            render json: @expenses
        end

        def show
            @expense = Expense.find(params[:id])
            render json: @expense
        end

        def create
            @expense = Expense.new(expense_params)
            if @expense.save
                render json: @expense, status: :created
            else
                render json: @expense.errors, status: :unprocessable_entity
            end
        end

        def update
            @expense = Expense.find(params[:id])
            if @expense.update(expense_params)
                render json: @expense, status: :ok
            else
                render json: @expense.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @expense = Expense.find(params[:id])
            @expense.destroy
        end

        private 

        def expense_params
            params.require(:expense).permit(:amount, :category_id, :date, :description, :frequency, :payment_method, :user_id)
          end     


    end
  end
  