require 'rails_helper'

RSpec.describe Match, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:player) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
