class CreateElementProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :element_properties do |t|
      t.belongs_to :element
      t.string :name
      t.string :input_type
      t.string :value

      t.timestamps
    end
  end
end
