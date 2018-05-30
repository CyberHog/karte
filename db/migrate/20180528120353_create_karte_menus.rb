class CreateKarteMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :karte_menus do |t|
      t.references :medical_chart, foreign_key: true	# MedicalChartへの外部キー
      t.string :course 									# メニュー名

      t.timestamps
    end
  end
end
