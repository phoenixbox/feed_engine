require 'spec_helper'
  
feature "autheticated user can post an image to their wall" do

  context "when logged in" do
    before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link 'Sign in with Twitter'
      click_link "My Crate"
    end

    it "user can login and visit their personal music wall", js: true do
      expect(current_path).to eq root_path
    end

    it "user will see the welcome message", js: true do
      expect(page).to have_content "Signed in as mockuser!"
    end

    it "user can get to image upload field", js: true do
      click_link "Post Image"
      click_button('image-post')
      expect(page).to have_content("Sorry pal")
    end
  end
end
