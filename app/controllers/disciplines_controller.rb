class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show]

  def show
  end

  def create
    @grade = Grade.find(params[:grade_id])
    authorize @grade

    @discipline = Discipline.new(discipline_params)

    @discipline.grade = @grade
    if @discipline.save
      redirect_to @grade, notice: 'Discipline was successfully created.'
    else
      # render 'grades/show'
      redirect_to @grade, notice: 'Discipline failed to be created.'

    end
  end

  private

  def set_discipline
    @discipline = Discipline.find(params['id'])
    authorize @discipline
  end

  def discipline_params
    params.require(:discipline).permit(:name)
  end

end
