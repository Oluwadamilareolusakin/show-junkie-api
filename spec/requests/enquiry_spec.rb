require 'rails_helper'

RSpec.describe 'Enquiry API', type: :request do
  let!(:enquiries) { create_list(:enquiry, 10) }
  let(:user) { create(:user) }
  let(:user_id) { user.id }

  describe 'get /enquries' do
    before { get '/enquiries' }

    it 'should return all enquiries' do
      expect(json.size).to eq(10)
      expect(json).to_not be_empty
    end

    it 'should return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'post /users/:user_id/enquiries' do
    let(:valid_attributes) { { user_id: user.id, message: 'This is a sample enquiry' } }

    context 'valid enquiry details' do
      before { post "/users/#{user_id}/enquiries", params: valid_attributes }

      it 'should create an enquiry' do
        expect(json['message']).to eq('This is a sample enquiry')
      end

      it 'should return status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
