require 'rails_helper'

RSpec.describe Vessel, type: :model do
  describe "Vessel" do
    it "Should be created" do
      expect {Vessel.create(name: Faker::Name.first_name,
      company_id: Faker::IDNumber.croatian_id(international: true),
      naccs_code: Faker::Barcode.upc_e)}.to change(Vessel, :count).by(1)
    end

    it "Should not be created(naccs_code)" do
      expect {Vessel.create(name: Faker::Name.first_name,
      company_id: Faker::IDNumber.croatian_id(international: true),
      naccs_code: '')}.to change(Vessel, :count).by(0)
    end
  end
end
