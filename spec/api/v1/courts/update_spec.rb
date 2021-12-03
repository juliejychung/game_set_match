require "rails_helper"

RSpec.describe "courts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/courts/#{court.id}", payload
  end

  describe "basic update" do
    let!(:court) { create(:court) }

    let(:payload) do
      {
        data: {
          id: court.id.to_s,
          type: "courts",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CourtResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { court.reload.attributes }
    end
  end
end
