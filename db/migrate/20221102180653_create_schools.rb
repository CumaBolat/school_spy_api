class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.text :name
      t.text :address

      t.timestamps
    end
  end
end
