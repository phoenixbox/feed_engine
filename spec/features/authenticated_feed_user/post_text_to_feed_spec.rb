require 'spec_helper'

feature "authenticated user can add feed_items to their feed" do

  context "when logged in" do

    before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link 'Sign in with Twitter'
      click_link 'My Feed'
    end

    let(:bad_content) { "a" * 514 }

    it "user can login and visit their personal music wall", js: true do
      expect(current_path).to eq root_path
      end

    it "user will see the welcome message", js: true do
      expect(page).to have_content "Signed in as,"
    end

    it "user can post a text feed_item to their wall ", js: true do
      click_link "Text Post"
      fill_in 'tl_text[content]', with: "Apple Bottom Jeans"
      click_button("text-post")
      expect(page).to have_content("Apple Bottom Jeans")

    end

    it "throws an error if the post is over 512 chars", js: true do
      click_link "Text Post"
      fill_in 'tl_text[content]', with: bad_content
      click_button("text-post")
      expect(page).to have_content("Your message must be between 1-512 characters")
    end
  end
end
