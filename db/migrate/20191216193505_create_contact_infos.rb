class CreateContactInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_infos do |t|
      t.references :type
      t.string :value

      t.timestamps
    end
  end
end
