class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :image_url

      t.timestamps
    end
  end
end
