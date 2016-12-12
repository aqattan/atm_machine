class AddImageToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :image, :string
  end
end
