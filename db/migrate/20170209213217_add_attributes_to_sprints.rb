class AddAttributesToSprints < ActiveRecord::Migration[5.0]
  def change
    add_column :sprints, :beibehalten, :text
    add_column :sprints, :aufhoeren, :text
    add_column :sprints, :integrieren, :text
  end
end
