require 'spec_helper'

feature "authenticated user can post a link to their wall" do

  context "when logged in", js: true do

    before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link 'Sign in with Twitter'
      click_link 'Go to my page'
    end

    it "user can login and visit their personal music wall" do
      expect(current_path).to eq root_path
    end

    it "user will see the welcome message" do
      expect(page).to have_content "This is my profile!"
    end

    it "user can post a link feed_item" do
      check('link')
      within(:css, 'div#linkpost') {
        fill_in 'tl_link_content', :with => 'Sample input'
        fill_in 'tl_link_link', :with => 'http://www.sample.com'
        click_button('Submit')
      }
      expect(current_path).to eq root_path
    end

    xit "user creates a link post and then the post can be seen in the timeline" do
      check('link')
      within(:css, 'div#linkpost') {
        fill_in 'tl_link_content', :with => 'Shane Rogers'
        fill_in 'tl_link_link', :with => 'http://www.shanerogers.com'
        click_button('Submit')
      }
      expect(page).to have_content 'Shane Rogers'
      expect(page).to have_content 'www.shanerogers.com'
    end
  end
end