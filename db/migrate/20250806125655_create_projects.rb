class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description
      t.boolean :published, default: false
      t.integer :position, default: 0

      t.timestamps
    end

    add_index :projects, :slug, unique: true
    add_index :projects, :published
    add_index :projects, :position
  end
end
