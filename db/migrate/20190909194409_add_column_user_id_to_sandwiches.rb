class AddColumnUserIdToSandwiches < ActiveRecord::Migration[5.2]
  def change
    add_column :sandwiches, :user_id, :integer
  end
end
