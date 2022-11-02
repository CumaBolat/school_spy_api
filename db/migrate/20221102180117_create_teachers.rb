class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.integer :age
      t.text :description

      t.timestamps
    end
  end
end
