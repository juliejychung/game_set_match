require "rails_helper"

RSpec.describe Court, type: :model do
  describe "Direct Associations" do
    it { should have_many(:lessons) }

    it { should have_many(:matches) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
