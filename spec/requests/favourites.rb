# frozen_string_literal: true

require 'rails_helper'

RSpec.describe do
  let!(:favourites) { create_list(:favourite, 10) }
  let(:favourite_id) { favourites.first.id }
  let(:user) { create(:user) }
  let(:user_id) { user.id }

  describe 'GET /users/:user_id/favourites' do
    before { get "/users/#{user_id}/favourites" }

    it 'should return a users favourites' do
      expect(json.size).to eq(10)
      expect(json).to_not be_empty
      expect(json['user_id']).to eq(i)
    end

    it 'should return status code 200' do
      expect(response).to have_http_code(200)
    end
  end

  describe 'POST /users/:user_id/favourites' do
    let(:valid_attributes) { { user_id: user_id, show_id: 1 }.to_json }
    before { post "/users/#{user_id}/favourites", params: valid_attributes, headers: headers }

    it 'should create a favourite' do
      expect(json['show_id']).to eq(1)
    end

    it 'should return status code 201' do
      expect(response).to have_http_code(201)
    end
  end

  describe 'DELETE /users/:user_id/favourites/:id' do
    before { delete "/users/#{user_id}/favourites/#{favourite_id}", headers: headers }

    it 'should create a favourite' do
      expect(response.body).to be_empty
    end

    it 'should return status code 204' do
      expect(response).to have_http_code(204)
    end
  end
end
