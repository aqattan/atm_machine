class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  
  def new_deposit
    @account = Account.find(params[:id])
  end
  
  def create_deposit
    @account = Account.find(params[:id])
    if deposit_params[:amount].to_f <= 1000 && @account.deposit(deposit_params)
        @account.transactions.create!(ammount: deposit_params[:amount], atm_machine_id: session[:my_atm_machine], transaction_type: 1)
        flash[:notice]="Deposit Created"
        redirect_to atm_machine_path(session[:my_atm_machine])
    else
      if deposit_params[:amount].to_f > 1000
       flash[:alert] = "The Maximum Amount to Deposit is $1000"
       render :new_deposit
      else
       flash[:alert] = "Please Enter A Valid Amount"
       render :new_deposit
      end
    end
  end
  
  def new_withdrawal
    @account =Account.find(params[:id])
  end
  
  def create_withdrawal 
    @account = Account.find(params[:id])
    if withdrawal_params[:amount].to_f <= @account.balance && withdrawal_params[:amount].to_f <= 500 && @account.withdrawal(withdrawal_params)
      @account.transactions.create!(ammount: withdrawal_params[:amount],atm_machine_id: session[:my_atm_machine], transaction_type: 2)
      flash[:notice]= "Withdrawal Created"
      redirect_to atm_machine_path(session[:my_atm_machine])
    else
      if withdrawal_params[:amount].to_f > 500
        flash[:alert]= "The Maximum Amount to Withdraw is $500"
        render :new_withdrawal
      else
        flash[:alert] = "Please Enter A Valid Amount"
        render :new_withdrawal
      end
    end
  end

  def index
    @accounts = Account.all
  end

 
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:account_no, :balance, :user_id)
    end
    
    def deposit_params
      params.require(:account).permit(:amount)
    end
    
    def withdrawal_params
      params.require(:account).permit(:amount)
    end
end
