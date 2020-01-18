# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::Cors do
  allow do
    origins '*'


    resource '*'
        :methods => [:get, :post, :put, :delete, :options],
        :headers => :any, :credentials => false
  end

  allow do
    origins '*'
    resource '/public/*', :headers => :any, :methods => :get
  end
end