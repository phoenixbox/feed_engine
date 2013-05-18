require 'spec_helper'
  
feature "autheticated user can post an image to their wall" do

  context "when logged in", js: true do
    before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link "Sign in with Twitter"
      click_link "Go to my page"
    end

     it "user can login and visit their personal music wall" do
      expect(current_path).to eq root_path
    end

    it "user will see the welcome message" do
      expect(page).to have_content "This is my profile!"
    end

    xit "user can post an image feed_item" do
      check('image')
      within(:css, 'div#imagepost') {
        page.attach_file('tl_image_image', '~/app/assets/images/test.png')
        fill_in 'tl_image_content', :with => 'Shane Rogers'
        click_button('Submit')
      }
      expect(current_path).to eq root_path
    end
  end
end