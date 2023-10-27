class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all

    render json: @teachers
  end

  def show
    teacher = Teacher.find_by(email: params[:email])

    if teacher&.authenticate(params[:password])
      render json: teacher, status: :ok
    else
      render json: {error: 'Invalid email or password'}, status: :unauthorized
    end
  end

  def create
    @teacher = Teacher.create(
      name: teacher_create_params[:name],
      surname: teacher_create_params[:surname],
      email: teacher_create_params[:email],
      phone_number: teacher_create_params[:phone_number],
      password_digest: teacher_create_params[:password],
      age: teacher_create_params[:age],
      school_id: school_id_from_school_name,
      description: teacher_create_params[:description]
    )

    if @teacher.save
      render json: @teacher, status: :ok
    else
      render json: {error: 'Invalid email or password'}, status: :unauthorized
    end
  end

  def update
    @teacher = Teacher.find(params[:id])

    @teacher.update(
      name: params[:name],
      surname: params[:surname],
      email: params[:email],
      phone_number: params[:phone_number],
      password_digest: params[:password_digest],
      age: params[:age],
      description: params[:description]
    )

    render json: @teacher, status: :ok
  end

  def destroy
    @teacher = Teacher.find(params[:id])

    @teacher.destroy

    render status: :ok
  end

  private

  def teacher_create_params
    params.permit(:name, :surname, :email, :phone_number, :password, :age, :school_name, :description)
  end

  def school_id_from_school_name
    school = School.find_by!(name: teacher_create_params[:school_name])
    school&.id
  end
end
