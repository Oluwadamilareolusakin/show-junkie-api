module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidToken < StandardError end;
  class MissingToken < StandardError end;
  class AuthenticationError < StandardError end;

  included do
    rescue from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue from ExceptionHandler::AuthenticationError, with: :four_zero_one

    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({message: error.message}, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      json_response({message: error.message}, :unprocessable_entity)  
    end
  end

  def four_twenty_two(error)
    json_response({message: error.message}, :unprocessable_entity)
  end


  def four_twenty_two(error)
    json_response({message: error.message}, :unauthorized)
  end
end