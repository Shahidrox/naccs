require 'rails_helper'

RSpec.describe "Api::V1::Vessels", type: :request do
  before do
    @vessel  = Vessel.create(name: Faker::Name.first_name, company_id: Faker::IDNumber.croatian_id(international: true), naccs_code: 'uniq')
    @vessel1 = Vessel.create(name: Faker::Name.first_name, company_id: Faker::IDNumber.croatian_id(international: true), naccs_code: Faker::Barcode.upc_e)
  end

  describe "API test" do
    it "The record should be created" do
      post '/api/v1/vessels',
        :params => {
          vessel: {
            name: Faker::Name.first_name,
            company_id: Faker::IDNumber.croatian_id(international: true),
            naccs_code: Faker::Barcode.upc_e 
          }
        }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["message"]).to eq(I18n.t('vessel.create'))
    end

    it "Name can't be blank" do
      post '/api/v1/vessels',
        :params => {
          vessel: {
            name: '',
            company_id: Faker::IDNumber.croatian_id(international: true),
            naccs_code: Faker::Barcode.upc_e 
          }
        }
      expect(response.status).to eq(400)
      puts JSON.parse(response.body)["message"]
      expect(JSON.parse(response.body)["message"]).to eq("Name can't be blank")
    end

    it "Company ID can't be blank" do
      post '/api/v1/vessels',
        :params => {
          vessel: {
            name: Faker::Name.first_name,
            company_id: '',
            naccs_code: Faker::Barcode.upc_e 
          }
        }
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)["message"]).to eq("Company can't be blank")
    end

    it "Naccs code can't be blank" do
      post '/api/v1/vessels',
        :params => {
          vessel: {
            name: Faker::Name.first_name,
            company_id: Faker::IDNumber.croatian_id(international: true),
            naccs_code: ''
          }
        }
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)["message"]).to eq("Naccs code can't be blank")
    end

    it "Naccs code can't be blank" do
      post '/api/v1/vessels',
        :params => {
          vessel: {
            name: Faker::Name.first_name,
            company_id: Faker::IDNumber.croatian_id(international: true),
            naccs_code: 'uniq'
          }
        }
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)["message"]).to eq("Naccs code has already been taken")
    end

    it "GET /vessels Index" do
      get '/api/v1/vessels'
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["message"]).to eq(I18n.t('vessel.list'))
    end

    it "GET /vessels/:id Show" do
      get "/api/v1/vessels/#{@vessel.id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["message"]).to eq(I18n.t('vessel.show'))
      expect(JSON.parse(response.body)["data"]["id"]).to eq(@vessel.id)
    end

    it "PATCH /vessels/:id Update" do
      patch "/api/v1/vessels/#{@vessel.id}",
        :params => {
          vessel: {
            name: Faker::Name.first_name,
          }
        }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["message"]).to eq(I18n.t('vessel.update'))
      expect(JSON.parse(response.body)["data"]["id"]).to eq(@vessel.id)
    end

    it "DELETE /vessels/:id Destroy" do
      delete "/api/v1/vessels/#{@vessel1.id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["message"]).to eq(I18n.t('vessel.delete'))
    end
  end

end
