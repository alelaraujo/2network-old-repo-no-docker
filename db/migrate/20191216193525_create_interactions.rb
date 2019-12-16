class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.references :user
      t.references :type
      t.text :note
      t.integer :point
      t.references :contact

      t.timestamps
    end
  end
end
