class GradesController < ApplicationController

  before_action :set_grade, only: [:show, :edit, :update]

  def show
    @disciplines = Discipline.where(grade: @grade)
    @discipline = Discipline.new

  end

  def index
    @grades = policy_scope(Grade)
  end

  def new
    @grade = Grade.new
    authorize @grade
  end

  def create
    @grade = Grade.new(grade_params)
    authorize @grade
    if @grade.save
      redirect_to @grade, notice: 'Grade was successfully created.'
    else
      render :new
    end
  end

  def update
    if @grade.update(grade_params)
      render :show, status: :ok, location: @grade
    else
      render :edit
    end
  end

  private

  def set_grade
    @grade = Grade.find(params['id'])
    authorize @grade
  end

  def grade_params
    params.require(:grade).permit(:name)
  end

end
