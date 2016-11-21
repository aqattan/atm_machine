class Account < ActiveRecord::Base
    belongs_to :user
    has_many :transactions
    validates_presence_of :user_id
    validates :balance, :numericality => { greater_than_or_equal_to: 0 }
    validates :account_no, :balance, :presence => true
end
