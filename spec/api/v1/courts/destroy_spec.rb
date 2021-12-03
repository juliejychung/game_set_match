require 'rails_helper'

RSpec.describe "courts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/courts/#{court.id}"
  end

  describe 'basic destroy' do
    let!(:court) { create(:court) }

    it 'updates the resource' do
      expect(CourtResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Court.count }.by(-1)
      expect { court.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
