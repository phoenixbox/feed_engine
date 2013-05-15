require 'spec_helper'

feature "authenticated user can add feed_items to their feed" do

  context "creating a new post" do

      it "posts text to a user's feed" do
        visit 'http://lvh.me:1234/'
        mock_auth_hash
        click_link 'Sign in with Twitter'
        click_link 'Go to my page'
        fill_in('feed_item_tl_text', :with => "This is a test post")
        click_button("Submit")
        expect(page).to have_content("This is a test post")
      end

      xit "throws an error if the post is over 512 chars"

      # Move the items below to separate features
      # Then I should see an option to attach an image
      # When I want to attach a photo
      # Then I am restricted to ADDING A COMMENT of 256 chars long 
      # When I want to include a link to another web page
      # Then I am restricted to ADDING A COMMENT of 256 chars long
  end

end
