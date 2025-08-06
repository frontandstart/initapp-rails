class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :project_type
      t.text :message
      t.string :status

      t.timestamps
    end
  end
end
