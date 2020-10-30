class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.string :title
      t.string :link
      t.text :description
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
