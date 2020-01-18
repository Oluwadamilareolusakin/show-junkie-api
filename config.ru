# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::Cors do
  allow do
    origins 'localhost:3000', 'showjunkie.herokuapp.com',


    resource '*'
        :methods => [:get, :post, :put, :delete, :options],
        :headers => 'Access-Control-Allow-Origin',
        :expose  => ['Authorization'],
        :max_age => 600        # headers to expose

  end

  allow do
    origins '*'
    resource '/public/*', :headers => :any, :methods => :get
  end
end