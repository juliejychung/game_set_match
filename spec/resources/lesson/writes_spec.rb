require "rails_helper"

RSpec.describe LessonResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "lessons",
          attributes: {},
        },
      }
    end

    let(:instance) do
      LessonResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Lesson.count }.by(1)
    end
  end

  describe "updating" do
    let!(:lesson) { create(:lesson) }

    let(:payload) do
      {
        data: {
          id: lesson.id.to_s,
          type: "lessons",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      LessonResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { lesson.reload.updated_at }
      # .and change { lesson.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:lesson) { create(:lesson) }

    let(:instance) do
      LessonResource.find(id: lesson.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Lesson.count }.by(-1)
    end
  end
end
