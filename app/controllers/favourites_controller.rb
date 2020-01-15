class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[destroy]

  def index
    @favourites = Favourites.where(user_id: (params[:user_id]).to_i)
    json_response(favourites)
  end

  def create
    @favourite = Favourite.create!(favourite_params)
  end

  def destroy
    @favourite.destroy
    head :no_content
  end

  private

  def set_favourite
    @favourites = Favourite.where(user_id: (params[:user_id]).to_i)
    @favourite = @favourites.find_by(id: (params[:id]).to_i)
  end
end
