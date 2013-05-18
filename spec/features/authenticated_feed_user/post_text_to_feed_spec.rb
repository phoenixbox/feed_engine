require 'spec_helper'

feature "authenticated user can add feed_items to their feed" do

  context "when logged in", js: true do

    before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link 'Sign in with Twitter'
      click_link 'Go to my page'
    end

    let(:bad_comment) { "a" * 513 }

    it "user can login and visit their personal music wall" do
      expect(current_path).to eq root_path
      end

    it "user will see the welcome message" do
      expect(page).to have_content "This is my profile!"
    end

    it "user can enter text in the textarea and " do
      check('text')
      within(:css, 'div#textpost') {
        fill_in 'tl_text_content', with: 'Sample input'
        click_button('Submit')
      }
      expect(page).to have_content("Sample input")
    end

    it "throws an error if the post is over 512 chars" do
      check('text')
      within(:css, 'div#textpost'){
        fill_in 'tl_text_content', with: bad_comment
        click_button('Submit')
      }
      expect(page).to have_content("Your message must be between 1-512 characters")
    end

    # Move the items below to separate features
    # Then I should see an option to attach an image
    # When I want to attach a photo
    # Then I am restricted to ADDING A COMMENT of 256 chars long 
    # When I want to include a link to another web page
    # Then I am restricted to ADDING A COMMENT of 256 chars long
  end

end
