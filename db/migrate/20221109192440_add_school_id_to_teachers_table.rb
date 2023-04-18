class AddSchoolIdToTeachersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :school_id, :integer  
  end
end
