require 'rails_helper'

RSpec.describe CourtResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'courts',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CourtResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Court.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:court) { create(:court) }

    let(:payload) do
      {
        data: {
          id: court.id.to_s,
          type: 'courts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CourtResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { court.reload.updated_at }
      # .and change { court.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:court) { create(:court) }

    let(:instance) do
      CourtResource.find(id: court.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Court.count }.by(-1)
    end
  end
end
