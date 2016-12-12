class UserInfo < ActiveRecord::Base
    
    belongs_to :user
    validates :first_name, :last_name, :phone, :presence => true
    after_create :create_account
    validate :image_size_validation
    mount_uploader :image, ImageUploader
    

    private
    def create_account
       Account.create(user_id: user_id, balance: 0.0) 
    end

    def image_size_validation
        errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
    end
end
