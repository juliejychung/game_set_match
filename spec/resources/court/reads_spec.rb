require "rails_helper"

RSpec.describe CourtResource, type: :resource do
  describe "serialization" do
    let!(:court) { create(:court) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(court.id)
      expect(data.jsonapi_type).to eq("courts")
    end
  end

  describe "filtering" do
    let!(:court1) { create(:court) }
    let!(:court2) { create(:court) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: court2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([court2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:court1) { create(:court) }
      let!(:court2) { create(:court) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      court1.id,
                                      court2.id,
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
                                      court2.id,
                                      court1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
