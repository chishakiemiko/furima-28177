class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string :name #仮のやつ
      t.string :text #仮のやつ
      t.text :image #仮のやつ
      t.timestamps
    end
  end
end
