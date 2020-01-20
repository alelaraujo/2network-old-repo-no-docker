class AddFrequencyToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :frequency, :integer
  end
end
