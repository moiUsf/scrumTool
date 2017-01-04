class CreateUserStories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_stories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
