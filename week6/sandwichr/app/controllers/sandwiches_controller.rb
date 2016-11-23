class SandwichesController < ApplicationController

  def index
    sandwiches = Sandwich.all
    render json: sandwiches
  end

  def create
    sandwich = Sandwich.create(sandwich_params)
    render json: sandwich
  end

  def show
    sandwich = Sandwich.find_by(id: params[:id])
    unless sandwich
      render json: {error: "sandwich not found"},
                    status: 404
      return
    end
    render json: sandwich, :include => :ingredients
  end

  def update
    sandwich = Sandwich.find_by(id: params[:id])
    unless sandwich
      render json: {error: "sandwich not found"},
                    status: 404
      return
    end
    sandwich.update(sandwich_params)
    render json: sandwich
  end

  def destroy
    sandwich = Sandwich.find_by(id: params[:id])
    unless sandwich
      render json: {error: "sandwich not found"},
                    status: 404
      return
    end
    sandwich.destroy
    render json: sandwich
  end

  def add_ingredient
    sandwich = Sandwich.find_by(id: params[:id])
    ingredient = Ingredient.find_by(id: params[:ingredient_id])

    unless sandwich
      render json: {error: "sandwich not found"},
                    status: 404
      return
    end

    unless ingredient
        render json: {error: "ingredient not found"},
                      status: 404
      return
    end

    sandwich.ingredients.push(ingredient)
    total_calories = sandwich.ingredients.reduce(0) do |sum, ing|
      sum + ing.calories.to_i
    end
    sandwich.update_attributes(total_calories: total_calories )
    render json: sandwich, :include => :ingredients
  end

  private

  def sandwich_params
    params.require(:sandwich)
    .permit(:name, :bread_type)
  end

end
