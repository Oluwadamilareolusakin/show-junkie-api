# frozen_string_literal: true

class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.all
    json_response(@suggestions)
  end

  def create
    @suggestion = current_user.suggestions.create!(suggestion_params)
    json_response(@suggestion, :created)
  end

  private

  def suggestion_params
    params.permit(:message, :user_id)
  end
end
