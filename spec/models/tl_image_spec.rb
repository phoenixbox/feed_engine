require 'spec_helper'

describe "TlImage" do

  context "valid input" do
    it "invalid content and data not saved in the data field" do
      tl_image = TlImage.create_from_form({"photo" => "not_a_photo"})
      expect(tl_image).to be_invalid
    end
  end

  context "invalid input" do
    it "prevents unspecifed attributes from being saved" do
      tl_image = TlImage.create_from_form({"content" => "test"})
      expect(tl_image.data).to eq({"content" => "test"})
    end
  end

end
