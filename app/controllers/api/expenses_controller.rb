class Api::ExpensesController < ApplicationController

    def index
        start_date = params[:startDate] || Date.today.beginning_of_month.to_s
        end_date = params[:endDdate] || Date.today.to_s
        aggregation_type = params[:aggregationType] || 'day'

        @expenses = Expense.all

        case aggregation_type
        when "day"
            @expenses = aggregate_by_day(@expenses, start_date, end_date)
        when "week"
            @expenses = aggregate_by_week(@expenses, start_date, end_date)
        when "month"
            @expenses = aggregate_by_month(@expenses, start_date, end_date)
        end

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

    def expense_params
        params.require(:expense).permit(:amount, :category_id, :date, :description, :frequency, :payment_method, :user_id)
    end     

    def aggregate_by_day(expenses, start_date, end_date)
        start_date = start_date.present? ? Date.parse(start_date) : Date.today.beginning_of_month
        end_date = end_date.present? ? Date.parse(end_date) : Date.today
    
        all_dates = (start_date..end_date).map { |date| [date, 0] }.to_h
    
        sums = expenses.where(date: start_date..end_date).group("DATE(date)").sum(:amount)
    
        all_dates.merge!(sums)
    
        all_dates.map { |date, sum| { date: date, amount: sum } }
    end
    

    def aggregate_by_week(expenses, start_date, end_date)
        start_date = Date.parse(start_date)
        end_date = Date.parse(end_date)
      
        all_weeks = (start_date..end_date).each_with_object({}) do |date, hash|
          hash[date.beginning_of_week] = 0
        end
      
        weekly_sums = expenses.where(date: start_date..end_date).group_by_week(:date).sum(:amount)
      
        all_weeks.merge!(weekly_sums)
      
        all_weeks.map { |date, sum| { date: date, amount: sum } }
      end
      
      def aggregate_by_month(expenses, start_date, end_date)
        start_date = Date.parse(start_date)
        end_date = Date.parse(end_date)
      
        all_months = (start_date..end_date).each_with_object({}) do |date, hash|
          hash[date.beginning_of_month] = 0
        end
      
        monthly_sums = expenses.where(date: start_date..end_date).group_by_month(:date).sum(:amount)
      
        all_months.merge!(monthly_sums)
      
        all_months.map { |date, sum| { date: date, amount: sum } }
      end

end
  