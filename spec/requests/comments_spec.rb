# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments API', type: :request do
  let!(:comments) { create_list(:comment, 10) }
  let(:user) { create(:user) }
  let(:id) { comments.first.id }
  let(:show) { 1 }
  let(:headers) { valid_headers }

  describe 'GET /shows/:id/comments' do
    before { get "/shows/#{show}/comments", headers: headers }

    it 'returns show comments' do
      expect(json.size).to eq(10)
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /shows/:id/comments' do
    let(:valid_attributes) { { show: 1, content: 'This is a sample comment' }.to_json }

    context 'when the request is valid' do
      before { post "/shows/#{show}/comments", params: valid_attributes, headers: headers }

      it 'creates a comment' do
        expect(json['content']).to eq('This is a sample comment')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      before { post "/shows/#{show}/comments", params: { content: 'Another sample comment' }.to_json, headers: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure content' do
        expect(response.body)
          .to match("{\"message\":\"Missing token\"}")
      end
    end
  end

  describe 'DELETE /shows/:show/:id/comments' do
    before { delete "/shows/#{show}/comments/#{id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
