class AtmMachine < ActiveRecord::Base
    geocoded_by :address
    after_validation :geocode
    validates :address, :presence => true
    has_many :transactions
end
