require "rails_helper"

RSpec.describe "lessons#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/lessons/#{lesson.id}", payload
  end

  describe "basic update" do
    let!(:lesson) { create(:lesson) }

    let(:payload) do
      {
        data: {
          id: lesson.id.to_s,
          type: "lessons",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(LessonResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { lesson.reload.attributes }
    end
  end
end
