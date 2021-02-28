module Api
  module V1
    class LineFoodsController < ApplicationController
      before_action :set_food, only: [:create, :replace]

      def index
        line_foods = LineFood.active
        if line_foods.exists?
          line_food_ids = []
          count = 0
          amount = 0

          line_foods.each do |line_food|
            line_food_ids << line_food.id
            count += line_food.count
            amount += line_food.total_amount
          end
          render json: {
            line_food_ids: line_food_ids,
            restaurant: line_foods.first.restaurant,
            count: count,
            amount: amount
          }, status: :ok
        else
          render json: {}, status: :no_content
        end
      end

      def create
        if LineFood.active.other_restaurant(@ordered_food.restaurant.id).exists?
      	  return render json: {
      	  	existing_restaurant: LineFood.other_restaurant(@ordered_food.restaurant.id).first.restaurant.name,
      	  	new_restaurant: @ordered_food.restaurant.name
      	  }, status: :not_acceptable
      	end
      	set_line_food(@ordered_food)

      	if @line_food.save
      	  render json: {
      	  	line_food: @line_food
      	  }, status: :ok
      	else
      	  render json: {}, status: :internal_server_error
      	end
      end

      def replace
        LineFood.active.other_restaurant(@ordered_food.restaurant.id).each do |line_food|
          p line_food
          line_food.update_attribute(:active, false)
        end
    
        set_line_food(@ordered_food)

        if @line_food.save
          render json: {
          	line_food: @line_food
          }, statuts: :ok
        else
          render json: {}, status: :internal_server_error
        end
      end

      private

      def set_food
      	@ordered_food = Food.find(params[:food_id])
      end

      def set_line_food(ordered_food)
      	if ordered_food.line_food.present?
      	  @line_food = ordered_food.line_food
      	  @line_food.attributes = {
      	   count: ordered_food.line_food.count + params[:count]
      	  }
      	else
      	  @line_food = ordered_food.build_line_food(
      	    count: params[:count],
      	    restaurant: ordered_food.restaurant,
      	    active: true
      	  )
      	end
      end
    end
  end
end
