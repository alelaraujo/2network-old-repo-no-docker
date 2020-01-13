class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.references :user
      t.references :type
      t.column :status, :integer, default: 0
      t.text :note
      t.integer :point
      t.references :contact

      t.timestamps
    end
  end
end
