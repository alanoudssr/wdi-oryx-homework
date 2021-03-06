class CheesesController < ApplicationController
  def index
    @cheeses = Cheese.all
  end

  def show
    @cheese = Cheese.find_by_id(params[:id])
  end

  def edit
    @cheese = Cheese.find_by_id(params[:id])
  end

  def update
    @cheese = Cheese.find_by_id(params[:id])
    @cheese.update(cheese_params)
    redirect_to @cheese
  end

  def new
    @cheese = Cheese.new
  end

  def create
    @cheese = Cheese.create(cheese_params)
    redirect_to cheeses_path
  end

  def destroy
    @cheese = Cheese.find(params[:id])
    @cheese.destroy
    redirect_to cheeses_path
  end

  private

  def cheese_params
    params.require(:cheese).permit(:name, :description, :milk_type,:stank_level, :image_url)
  end
end
