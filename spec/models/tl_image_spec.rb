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
    it "validates presence of content" do
      invalid_attributes = {"content" => ""}
      expect{ TlImage.create_from_form(invalid_attributes) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "requires the length be less than 240 chars" do
      invalid_attributes = { "content" => "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?" }
      expect{ TlImage.create_from_form(invalid_attributes) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "prevents unspecifed attributes from being saved" do
      tl_image = TlImage.create_from_form({"content" => "test"})
      expect(tl_image.data).to eq({"content" => "test"})
    end
  end

end
