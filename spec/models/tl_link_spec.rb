require 'spec_helper'

describe "TlLink" do

  context "valid input" do
    it "creates a record with content saved in the data field" do
      tl_link = TlLink.create_from_form({"content" => "This is a test...", "link" => "http://www.google.com"})
      expect(tl_link).to be_valid
      expect(tl_link.content).to eq("This is a test...")
    end
  end

  context "invalid input" do

     let(:bad_content) { "a" * 257 }

    it "validates presence of content" do
      expect(TlLink.create_from_form({"content" => "", "link" => "www.google.com"})).to_not be_valid
    end

    it "validates the link" do 
      expect(TlLink.create_from_form({"content" => bad_content, "link" => "qwerty"})).to_not be_valid
    end

    it "requires the content length be less than 240 chars" do
      expect(TlLink.create_from_form({"content" => bad_content, "link" => "www.google.com"})).to_not be_valid
    end

    it "prevents unspecifed attributes from being saved" do
      tl_link = TlLink.create_from_form({"content" => "test", "link" => "http://www.google.com"})
      expect(tl_link.data).to eq({"content" => "test", "link" => "http://www.google.com"})
    end
  end

end
