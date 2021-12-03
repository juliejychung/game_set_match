require 'rails_helper'

RSpec.describe "lessons#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/lessons/#{lesson.id}", params: params
  end

  describe 'basic fetch' do
    let!(:lesson) { create(:lesson) }

    it 'works' do
      expect(LessonResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('lessons')
      expect(d.id).to eq(lesson.id)
    end
  end
end
