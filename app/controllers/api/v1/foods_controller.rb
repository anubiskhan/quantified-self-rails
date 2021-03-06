class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    food = Food.find_by_id(params[:id])
    food ? (render json: food) : (render json: {}, status: 404)
  end

  def create
    food = Food.new(food_params)
    food.save ? (render json: food) : (render json: {}, status: 400)
  end

  def update
    food = Food.find_by_id(params[:id])
    food_params.keys.include?('name' || 'calories') ? (food.update(food_params); render json: food) : (render json: {}, status: 400)
  end

  def destroy
    food = Food.find_by_id(params[:id])
    food ? (food.destroy; render json: {}, status: 204) : (render json: {}, status: 404)
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
