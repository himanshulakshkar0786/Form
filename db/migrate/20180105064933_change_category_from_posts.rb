class ChangeCategoryFromPosts < ActiveRecord::Migration[5.1]
  def change
  	change_column :posts, :category, :integer
  end
end
