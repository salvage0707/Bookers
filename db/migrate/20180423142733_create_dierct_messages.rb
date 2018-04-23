class CreateDierctMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :dierct_messages do |t|
      t.integer :user_id
      t.integer :to_user_id
      t.text :direct_message

      t.timestamps
    end
  end
end
