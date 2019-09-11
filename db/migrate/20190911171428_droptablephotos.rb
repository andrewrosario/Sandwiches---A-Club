class Droptablephotos < ActiveRecord::Migration[6.0]
  def change
    drop_table :photos
  end
end
