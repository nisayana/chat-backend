class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :content

      t.timestamps
    end
  end
end
