class ExpensesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        @expenses = current_user.expenses.page(params[:page]).per(10)
        render json: @expenses
    end

    def show
        @expense = current_user.expenses.find(params[:id])
        render json: @expense
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Expense not found" }, status: :not_found
    end

    def create 
        @expense = current_user.expenses.build(expense_params)
        if @expense.save
            render json: @expense, status: :created, location: @expense
        else
            render json: @expense.errors, status: :unprocessable_entity
        end
    end

    def update
        @expense = current_user.expenses.find(params[:id])
        if @expense.update(expense_params)
            render json: @expense
        else
            render json: @expense.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @expense = current_user.expenses.find(params[:id])
        @expense.destroy
        head :no_content
    end


    private

    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
    end

    private

    def expense_params
        params.require(:expense).permit(:category, :amount, :date, :description, :payment_method)
    end

end
