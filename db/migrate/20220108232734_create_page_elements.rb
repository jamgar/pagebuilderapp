class CreatePageElements < ActiveRecord::Migration[6.1]
  def change
    create_table :page_elements do |t|
      t.belongs_to :page, null: false, foreign_key: true
      t.belongs_to :element, null: false, foreign_key: true
      t.jsonb :properties, null: false, default: '{}'

      t.timestamps
    end
  end
end
