class AddColumnUserIdToSandwiches < ActiveRecord::Migration[6.0]
  def change
    add_column :sandwiches, :user_id, :integer
  end
end
