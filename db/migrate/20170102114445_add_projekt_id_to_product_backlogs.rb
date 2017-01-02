class AddProjektIdToProductBacklogs < ActiveRecord::Migration[5.0]
  def change
  	add_column :product_backlogs, :projekt_id, :integer
  end
end
