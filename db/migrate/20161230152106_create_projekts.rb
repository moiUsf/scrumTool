class CreateProjekts < ActiveRecord::Migration[5.0]
  def change
    create_table :projekts do |t|
      t.string :name

      t.timestamps
    end
  end
end
