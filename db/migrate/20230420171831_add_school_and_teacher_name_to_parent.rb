class AddSchoolAndTeacherNameToParent < ActiveRecord::Migration[6.0]
  def change
    add_column :parents, :school_name, :string
    add_column :parents, :teacher_name, :string
  end
end
