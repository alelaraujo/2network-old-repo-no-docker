class RenameInteractionsToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_table :interactions, :events
  end
end
