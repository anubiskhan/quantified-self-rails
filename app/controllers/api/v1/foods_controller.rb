class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    food = Food.find_by_id(params[:id])
    food ? (render json: food) : (render json: {}, status: 404)
  end

  def create

  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
