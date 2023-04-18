class TeachersController < ApplicationController
    def index
        @teachers = Teacher.all

        render json: @teachers
    end

    def show
      teacher = Teacher.find_by(email: params[:email])

      if teacher && teacher.authenticate(params[:password])
        render json: teacher, status: 200
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end

    def create
        @teacher = Teacher.create!(
            name: params[:name],
            surname: params[:surname],
            email: params[:email],
            phone_number: params[:phone_number],
            password_digest: params[:password_digest],
            age: params[:age],
            school_id: params[:school_id],
            description: params[:description]
        )

        render json: @teacher        
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

        render json: @teacher
    end

    def destroy
        @teacher = Teacher.find(params[:id])

        @teacher.destroy

        render status: :ok
    end
  end
  