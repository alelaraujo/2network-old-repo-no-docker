class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :type, foreign_key: true
      t.text :note
      t.integer :score, default: 1
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
