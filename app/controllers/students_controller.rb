class StudentsController < ApplicationController
  def index
    @students = User.only_students
  end

  def edit
    @student = User.find(params[:id])
  end

  def create
    #kikoo
  end

  def update
    #kikoo
  end

  def new
    @student = Student.new
  end
end