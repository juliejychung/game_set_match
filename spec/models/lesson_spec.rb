require 'rails_helper'

RSpec.describe Lesson, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:coach) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
