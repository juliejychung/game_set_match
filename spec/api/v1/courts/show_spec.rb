require 'rails_helper'

RSpec.describe "courts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/courts/#{court.id}", params: params
  end

  describe 'basic fetch' do
    let!(:court) { create(:court) }

    it 'works' do
      expect(CourtResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('courts')
      expect(d.id).to eq(court.id)
    end
  end
end
