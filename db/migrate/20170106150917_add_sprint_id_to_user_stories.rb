class AddSprintIdToUserStories < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_stories, :sprint_id, :integer 
  end
end
