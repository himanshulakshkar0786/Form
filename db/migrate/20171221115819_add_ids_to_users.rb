class AddIdsToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :country_id, :integer
  	add_column :users, :state_id, :integer

  end
end
