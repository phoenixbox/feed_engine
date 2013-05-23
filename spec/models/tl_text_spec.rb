require 'spec_helper'

describe "TlText" do

  context "valid input" do
    it "creates a record with content saved in the data field" do
      tl_text = TlText.create_from_form({"content" => "This is a test..."})
      expect(tl_text).to be_valid
      expect(tl_text.content).to eq("This is a test...")
    end
  end

  context "invalid input" do
    let(:bad_content)   { "a" * 513 }

    it "validates presence of content" do
      tl_text = TlText.create_from_form("")
      expect(tl_text).to_not be_valid
    end

    it "requires the length be less than 512 chars" do
      tl_text = TlText.create_from_form({ "content" => bad_content })
      expect(tl_text).to_not be_valid
    end
  end

end
