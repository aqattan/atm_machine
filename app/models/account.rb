class Account < ActiveRecord::Base
    belongs_to :user
    has_many :transactions
    attr_accessor :amount
    #validates_presence_of :user_id
    validates :balance, :numericality => { greater_than_or_equal_to: 0 }
    validates :account_no, :balance, :presence => true
    
    def  deposit (amnt)
        if amnt[:amount].to_f < 0.0 || maximum_deposit?(amnt[:amount])
            alert = "Error!"
        else
         self.balance= self.balance + amnt[:amount].to_f
         self.save
         self.transactions.create!(ammount: amnt[:amount], transaction_type: 1)
         alert = "Deposit Created!"
        end
         alert
    end
    private
    def maximum_deposit? (current_amount)
    amount_list= self.transactions.today.where(transaction_type: 1).pluck(:ammount)
    sum=amount_list.map(&:to_f).reduce(:+)
    new_balance_today= sum.to_f + current_amount.to_f
    if new_balance_today >1000
        return true
    else
        false
    end
    
    end 
end
