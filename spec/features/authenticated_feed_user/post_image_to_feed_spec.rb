require 'spec_helper'
  
feature "autheticated user can post an image to their wall" do

  context "when logged in" do
    before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link 'Sign in with Twitter'
    end

    it "user can login and visit their personal music wall", js: true do
      expect(current_path).to eq root_path
    end

    it "user will see the welcome message", js: true do
      expect(page).to have_content "Signed in as, Mock User"
    end

    it "user can post an image feed_item", js: true do
      click_link "Image Post"
      page.attach_file('Rails', '/app/assets/images/rails.png')
      click_button('image-post')
      expect(page).to have_content("rails.png")
    end
  end
end


