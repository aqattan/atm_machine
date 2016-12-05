class Transaction < ActiveRecord::Base
    belongs_to :account
    validates_presence_of :account_id
    validates :transaction_type, :ammount, :presence => true
    scope :today, -> {where('DATE(created_at)=?',Date.today)}
    default_scope -> { order(created_at: :desc) } 
end
