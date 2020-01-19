# frozen_string_literal: true

class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[destroy]
  skip_before_action :authorize_request, only: %i[create]

  def index
    @favourites = current_user.favourites
    json_response(@favourites)
  end

  def create
    favourite = current_user.favourites.create!(favourite_params)
    json_response(favourite, :created)
  end

  def destroy
    @favourite.destroy
    head :no_content
  end

  private

  def set_favourite
    @favourites = current_user.favourites
    @favourite = @favourites.find_by(id: params[:id].to_i)
  end

  def favourite_params
    params.permit(:show_id)
  end
end
