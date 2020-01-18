# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Suggestions API', type: :request do
  let!(:suggestions) { create_list(:suggestion, 10) }
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:headers) { valid_headers }

  describe 'GET /suggestions' do
    before { get '/suggestions', headers: headers }

    it 'should return all suggestions' do
      expect(json.size).to eq(10)
      expect(json).to_not be_empty
    end

    it 'should return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users/:user_id/suggestions' do
    let(:valid_attributes) { { message: 'This is a sample suggestion', user_id: user.id }.to_json }

    context 'with valid attributes' do
      before { post "/users/#{user_id}/suggestions", params: valid_attributes, headers: headers }

      it 'should create a suggestion' do
        expect(json['message']).to eq('This is a sample suggestion')
      end

      it 'should return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid details' do
      before { post '/users/:user_id/suggestions', params: { message: 'Another message' }.to_json, headers: {} }

      it 'should return validation failure content' do
        expect(response.body).to match('{"message":"Missing token"}')
      end
    end
  end
end
