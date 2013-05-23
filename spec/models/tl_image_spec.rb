require 'spec_helper'

describe "TlImage" do

  context "valid input" do
    it "invalid content and data not saved in the data field" do
      tl_image = TlImage.create_from_form({"content" => "", "photo" => "not_a_photo"})
      expect(tl_image).to be_invalid
    end
  end

  context "invalid input" do
    let(:bad_content) { "a" * 257 }

    xit "validates presence of content" do
      invalid_attributes = {"content" => ""}
      expect{ TlImage.create_from_form(invalid_attributes) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    xit "requires the length be less than or equal to 256 chars" do
      invalid_attributes = { "content" => bad_content }
      expect{ TlImage.create_from_form(invalid_attributes) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    xit "prevents unspecifed attributes from being saved" do
      tl_image = TlImage.create_from_form({"content" => "test"})
      expect(tl_image.data).to eq({"content" => "test"})
    end
  end

end
