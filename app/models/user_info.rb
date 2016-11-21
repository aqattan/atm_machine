class UserInfo < ActiveRecord::Base
    belongs_to :user
    validates :first_name, :last_name, :phone, :presence => true
end
