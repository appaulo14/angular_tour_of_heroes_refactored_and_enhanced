require 'rails_helper'


RSpec.describe 'Heroes API', type: :request do

  before (:each) do
    @heroes = FactoryGirl.create_list(:hero,10)
    @hero_id = @heroes.first.id
  end

  # Test suite for GET /heroes
  describe 'GET /heroes' do
    # make HTTP get request before each example
    before (:each) do
        get '/heroes'
        #@json_response = JSON.parse(response.body)
    end

    it 'returns heroes' do
      expect(response.body).not_to be_empty
      #expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /heroes/:id
  describe 'GET /heroes/:id' do
    before { get "/heroes/#{@hero_id}" }

    context 'when the record exists' do
      it 'returns the hero' do
        expect(response.body).not_to be_empty
        #expect(json['id']).to eq(@hero_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before (:each) do
          @hero_id = 100
          get "/heroes/#{@hero_id}"
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end
