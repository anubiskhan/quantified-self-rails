class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    Food.find_by_id(params[:id]) ? (render json: Food.find_by_id(params[:id])) : (render json: {}, status: 404)
  end
end
