class ChangeDataTypeEmotionTemperatureOnUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :emotion_pref, 'integer USING CAST(emotion_pref AS integer)'
    change_column :users, :temperature_pref, 'integer USING CAST(temperature_pref AS integer)'
  end
end
