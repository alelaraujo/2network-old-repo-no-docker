class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user
      t.references :type
      t.text :note
      t.integer :score, default: 1
      t.references :contact

      t.timestamps
    end
  end
end
