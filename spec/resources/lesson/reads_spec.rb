require "rails_helper"

RSpec.describe LessonResource, type: :resource do
  describe "serialization" do
    let!(:lesson) { create(:lesson) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(lesson.id)
      expect(data.jsonapi_type).to eq("lessons")
    end
  end

  describe "filtering" do
    let!(:lesson1) { create(:lesson) }
    let!(:lesson2) { create(:lesson) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: lesson2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([lesson2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:lesson1) { create(:lesson) }
      let!(:lesson2) { create(:lesson) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      lesson1.id,
                                      lesson2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      lesson2.id,
                                      lesson1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
