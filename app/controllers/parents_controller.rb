class ParentsController < ApplicationController
  def index
    @parents = Parent.all

    render json: @parents
  end

  def show
    parent = Parent.find_by(email: params[:email])

    if parent && parent.authenticate(params[:password])
      render json: parent, status: 200
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def create
    @parent = Parent.create(
      name: params[:name],
      surname: params[:surname],
      child_name: params[:child_name],
      email: params[:email],
      phone_number: params[:phone_number],
      password_digest: params[:password_digest],
      social_id: params[:social_id],
      parent_job: params[:parent_job],
      parent_age: params[:parent_age],
      child_age: params[:child_age],
      child_grade: params[:child_grade],
      child_school_id: params[:child_school_id],
      teacher_id: params[:teacher_id],
      is_only_child: params[:is_only_child]
    )

    if @parent.save
      render json: @parent, status: 200
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
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
end
