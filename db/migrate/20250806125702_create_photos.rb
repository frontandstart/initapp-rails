class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :position, default: 0
      t.string :alt_text
      t.string :caption

      t.timestamps
    end

    add_index :photos, [:project_id, :position]
  end
end
