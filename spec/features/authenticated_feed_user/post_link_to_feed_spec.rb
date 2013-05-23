require 'spec_helper'

feature "authenticated user can post a link to their wall" do

  context "when logged in" do

   before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link 'Sign in with Twitter'
      click_link "My Feed"
    end


    it "user can login and visit their personal music wall", js: true do
      expect(current_path).to eq root_path
    end

    it "user will see the welcome message", js: true do
      expect(page).to have_content "Signed in as,"
    end

    it "user can post a link feed_item", js: true do
      click_link "Link Post"
      fill_in 'tl_link[link]', with: "www.google.com"
      fill_in 'tl_link[content]', with: "LeGoogs"
      click_button("link-post")
      expect(page).to have_content("www.google.com")
    end

    it "validates the input of the link and the length of the content", js: true do
      click_link "Link Post"
      fill_in 'tl_link[link]', with: "NotALink"
      fill_in 'tl_link[content]', with: "Yeahs"
      click_button("link-post")
      expect(page).to_not have_content("NotALink")
    end
  end
end