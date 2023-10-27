class ParentsController < ApplicationController
  def index
    @parents = Parent.all

    render json: @parents
  end

  def show
    parent = Parent.find_by(email: params[:email])

    if parent&.authenticate(params[:password])
      render json: parent, status: :ok
    else
      render json: {error: 'Invalid email or password'}, status: :unauthorized
    end
  end

  def create
    @parent = Parent.create(
      name: parent_create_params[:name],
      surname: parent_create_params[:surname],
      child_name: parent_create_params[:child_name],
      email: parent_create_params[:email],
      phone_number: parent_create_params[:phone_number],
      password_digest: parent_create_params[:password],
      social_id: parent_create_params[:social_id],
      parent_job: parent_create_params[:parent_job],
      parent_age: parent_create_params[:parent_age],
      child_age: parent_create_params[:child_age],
      child_grade: parent_create_params[:child_grade],
      child_school_id: parent_create_params[:child_school_id],
      teacher_id: teacher_id_from_teacher_name,
      is_only_child: parent_create_params[:is_only_child],
      school_name: parent_create_params[:school_name],
      teacher_name: parent_create_params[:teacher_id]
    )

    if @parent.save
      render json: @parent, status: :ok
    else
      render json: {error: 'Invalid email or password'}, status: :unauthorized
    end
  end

  def update
    @parent = Parent.find(params[:id])

    @parent.update(
      name: params[:name],
      surname: params[:surname],
      email: params[:email],
      phone_number: params[:phone_number],
      password_digest: params[:password_digest],
      age: params[:age],
      description: params[:description]
    )

    render json: @parent
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy

    render status: :ok
  end

  private

  def parent_create_params
    params.permit(:name, :surname, :email,
                  :phone_number, :password,
                  :school_name,
                  :child_name, :child_age, :child_grade,
                  :child_school_id, :teacher_id,
                  :is_only_child, :parent_job,
                  :parent_age, :social_id)
  end

  def school_id_from_school_name
    school = School.find_by!(name: parent_create_params[:school_name])
    school&.id
  end

  def teacher_id_from_teacher_name
    teacher = Teacher.find_by!(name: parent_create_params[:teacher_id])
    teacher&.id
  end
end
