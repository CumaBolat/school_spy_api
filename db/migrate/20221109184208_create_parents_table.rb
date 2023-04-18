class CreateParentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :parents_tables do |t|
      t.string :name
      t.string :surname
      t.string :child_name
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.string :social_id
      t.string :parent_job

      t.integer :parent_age
      t.integer :child_age
      t.integer :child_grade
      t.integer :child_school_id
      t.integer :teacher_id
      
      t.boolean :is_only_child
    end
  end
end
