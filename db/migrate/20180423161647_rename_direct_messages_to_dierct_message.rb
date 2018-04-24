class RenameDirectMessagesToDierctMessage < ActiveRecord::Migration[5.1]
  def change
  	rename_table :direct_message, :direct_messages
  end
end
