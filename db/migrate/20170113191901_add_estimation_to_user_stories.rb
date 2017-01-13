class AddEstimationToUserStories < ActiveRecord::Migration[5.0]
  def change
    add_column :user_stories, :estimation, :float
  end
end
