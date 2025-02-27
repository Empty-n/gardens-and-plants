class CompletionsController < ApplicationController

  def new
    @completion = Completion.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    @completion = Completion.new(completion_params)
    @plant = Plant.find(params[:plant_id])
    @completion.plant = @plant
    if @completion.save
      redirect_to garden_path(@plant.garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def completion_params
    params.require(:completion).permit(:chore_id)
  end
end
