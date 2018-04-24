class RenameDirectMessageToDierctMessage < ActiveRecord::Migration[5.1]
  def change
  	rename_table :dierct_messages, :direct_message
  end
end
