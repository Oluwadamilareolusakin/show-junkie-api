# frozen_string_literal: true

class EnquiriesController < ApplicationController
  def index
    @enquiries = Enquiry.all
    json_response(@enquiries)
  end

  def create
    @enquiry = current_user.enquiries.create!(enquiry_params)
    json_response(@enquiry, :created)
  end

  private

  def enquiry_params
    params.permit(:message, :user_id)
  end
end
