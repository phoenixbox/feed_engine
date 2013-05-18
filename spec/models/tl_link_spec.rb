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
    let(:bad_content)   { "a" * 257 }

    it "validates presence of content" do
      invalid_attributes = {"content" => "", "link" => ""}
      expect{ TlLink.create_from_form(invalid_attributes) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "requires the length be less than 240 chars" do
      invalid_attributes = { "link" => "http://www.google.com", "content" => bad_content }
      expect{ TlLink.create_from_form(invalid_attributes) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "prevents unspecifed attributes from being saved" do
      tl_link = TlLink.create_from_form({"content" => "test", "link" => "http://www.google.com"})
      expect(tl_link.data).to eq({"content" => "test", "link" => "http://www.google.com"})
    end
  end

end
