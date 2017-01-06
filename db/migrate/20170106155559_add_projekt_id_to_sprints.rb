class AddProjektIdToSprints < ActiveRecord::Migration[5.0]
  def change
  	add_column :sprints, :projekt_id, :integer  
  end
end
