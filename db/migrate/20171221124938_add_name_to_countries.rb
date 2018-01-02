class AddNameToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :name, :string
  end
end
