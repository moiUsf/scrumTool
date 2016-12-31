class AddUserIdToProjekts < ActiveRecord::Migration[5.0]
  def change
  	add_column :projekts, :user_id, :integer
  end
end
