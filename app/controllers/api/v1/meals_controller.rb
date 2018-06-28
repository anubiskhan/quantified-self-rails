class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    meal = Meal.find_by_id(params[:meal_id])
    meal ? (render json: meal) : (render json: {}, status: 404)
  end

  def create
    meal = Meal.find_by_id(params[:meal_id])
    food = Food.find_by_id(params[:id])
    meal && food ? (meal.foods << food; render json: { message: "Successfully added #{food.name} to #{meal.name}" }) : (render json: {}, status: 404)
  end
end
