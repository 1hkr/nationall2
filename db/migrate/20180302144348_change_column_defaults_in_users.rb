class ChangeColumnDefaultsInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :answered, false
  end
end
