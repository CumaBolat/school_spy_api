class SchoolsController < ApplicationController
  def index
    @schools = School.all

    render json: @schools
  end

  def show
    @school = School.find(params[:id])

    render json: @school
  end

  def create
    @school = School.create(
      name: params[:name],
      address: params[:address]
    )

    render json: @school
  end
end
