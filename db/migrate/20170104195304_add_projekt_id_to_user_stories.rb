class AddProjektIdToUserStories < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_stories, :projekt_id, :integer  
  end
end
