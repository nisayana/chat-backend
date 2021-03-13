class RemoveContentFromChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :chatrooms, :content, :string
  end
end
