require "rails_helper"

RSpec.describe "lessons#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/lessons/#{lesson.id}"
  end

  describe "basic destroy" do
    let!(:lesson) { create(:lesson) }

    it "updates the resource" do
      expect(LessonResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Lesson.count }.by(-1)
      expect { lesson.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
