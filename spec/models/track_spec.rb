require 'rails_helper'

describe Track, type: :model do

  context "errors" do
    describe "can not create track without audio file" do
      it do
        expect{
          create(:invalid_track)
        }.to raise_error("Validation failed: Audio can't be blank")
      end
    end

    describe "only accepts audio files" do
      it do
        expect{
          create(:invalid_extension)
        }.to raise_error("Validation failed: Audio content type is invalid, Audio is invalid")
      end
    end
  end

  describe do
    it "creates tracks with correct attributes" do
      expect{ create(:track) }.not_to raise_error
    end
  end
end
