require 'rails_helper'

RSpec.describe 'Tools', type: :request do
  let!(:tools) { create_list(:tool, 10) }

  let(:tool_id) { tools.first.id }

  let(:valid_attributes) do
    attributes_for(:tool)
  end

  let(:invalid_attributes) do
    attributes_for(:tool, title: nil)
  end

  describe 'GET /tools' do
    before do
      get '/tools'
    end

    it 'returns tools' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'when passing a search parameter' do
      before do
        get '/tools?tag=db'
      end

      it 'returns found tools with search option' do
        expect(json).not_to be_empty
      end
    end
  end

  describe 'GET /tools/:id' do
    before do
      get "/tools/#{tool_id}"
    end

    context 'when the record exists' do
      it 'returns the tools' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tool_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:tool_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tool/)
      end
    end
  end

  describe 'POST /tools' do
    context 'when the request is valid' do
      before do
        post '/tools', params: { tool: valid_attributes }
      end

      it 'creates a tool' do
        expect(json['title']).to eq(valid_attributes[:title])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before do
        post '/tools', params: { tool: invalid_attributes }
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  describe 'PUT /tools/:id' do
    let(:new_attributes) do
      attributes_for(:tool, title: 'Visual Studio Code')
    end
    before do
      put "/tools/#{tool_id}", params: { tool: new_attributes }
    end

    context 'when the record exists' do
      it 'updates the record' do
        expect(json['title']).to eq('Visual Studio Code')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:tool_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tool/)
      end
    end
  end

  describe 'DELETE /tools/:id' do
    before do
      delete "/tools/#{tool_id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
