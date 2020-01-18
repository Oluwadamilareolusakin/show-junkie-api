# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    auth_result =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    data = {
      auth_token: auth_result[:auth_token],
      user: auth_result[:user]
    }
    json_response(data)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
