class UserInfo < ActiveRecord::Base
    belongs_to :user
    validates :first_name, :last_name, :phone, :presence => true
    after_create :create_account
    
    private
    def create_account
       Account.create(user_id: user_id, balance: 0.0) 
    end
end
