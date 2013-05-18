require 'spec_helper'

describe "TlImage" do

  context "valid input" do
    it "creates a record with content saved in the data field" do
      tl_image = TlImage.create_from_form({"content" => "This is a test...", "link" => "http://www.google.com"})
      expect(tl_image).to be_valid
      expect(tl_image.content).to eq("This is a test...")
    end
  end

  context "invalid input" do
    let(:bad_content) { "a" * 257 }

    it "validates presence of content" do
      invalid_attributes = {"content" => ""}
      expect{ TlImage.create_from_form(invalid_attributes) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "requires the length be less than or equal to 256 chars" do
      invalid_attributes = { "content" => bad_content }
      expect{ TlImage.create_from_form(invalid_attributes) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "prevents unspecifed attributes from being saved" do
      tl_image = TlImage.create_from_form({"content" => "test"})
      expect(tl_image.data).to eq({"content" => "test"})
    end
  end

end
