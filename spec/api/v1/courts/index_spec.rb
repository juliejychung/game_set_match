require "rails_helper"

RSpec.describe "courts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/courts", params: params
  end

  describe "basic fetch" do
    let!(:court1) { create(:court) }
    let!(:court2) { create(:court) }

    it "works" do
      expect(CourtResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["courts"])
      expect(d.map(&:id)).to match_array([court1.id, court2.id])
    end
  end
end
