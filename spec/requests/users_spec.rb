require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }
  let(:user_id) { user.id }

  describe 'GET /users' do
    before { get '/users' }

    it 'should return all Users' do
      expect(json.size).to eq(10)
      expect(json).to_not be_empty
    end

    it 'should return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) { { name: "Name", email: "oluwadamilareo@fixus.com.ng", password: "Thisisasample123" } }

    context 'with valid attributes' do
      before { post "/users", params: valid_attributes }

      it 'should create a user' do
        expect(json['name']).to eq("Name")
      end

      it 'should return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid details' do
      before { post '/users', params: { name: "Another name" } }

      it 'should return validation failure content' do
        expect(response.body).to match(/Validation failed: Email can't be blank, Password can't be blank/)
      end
    end
  end

  describe 'PUT /users/:id' do
    let(:valid_attributes) { { name: "New name", email: "oluwadamilareo@fixus.com.ng", password: "Thisisasample123" } }

    context 'when the record exists' do
      before { put "/users/#{user_id}", params: valid_attributes }

      it 'should update a user' do
        expect(response.body).to be_empty
      end

      it 'should return status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
