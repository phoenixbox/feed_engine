require 'spec_helper'

feature "authenticated user can add feed_items to their feed" do
  # user must login
  before "sign in user with Twitter account" do
    visit '/'
    mock_auth_hash
    click_link 'Sign in with Twitter'
    visit root_path(subdomain: "mockuser")
  end

  describe "creating a new post" do

    context "text only" do
      it "posts text to a user's feed", js: true do

        # click_link "Post"
        # Then I should see a text field with a post button
        # And it should be limited to 512 chars
      end
    end

    context "creating a new image" do
      # Then I should see an option to attach an image
      # When I want to attach a photo
      # Then I am restricted to ADDING A COMMENT of 256 chars long 
    end

    context "creating a new link" do
      # When I want to include a link to another web page
      # Then I am restricted to ADDING A COMMENT of 256 chars long
    end

  end


  # it "can sign in user with Twitter account" do
  #   visit '/'
  #   page.should have_content("Sign in with Twitter")
  #   mock_auth_hash
  #   click_link "Sign in"
  #   page.should have_content("mockuser")  # user name
  #   page.should have_css('img', :src => 'mock_user_thumbnail_url') # user image
  #   page.should have_content("Sign out")
  # end
 
  # it "can handle authentication error" do
  #   OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
  #   visit '/'
  #   page.should have_content("Sign in with Twitter")
  #   click_link "Sign in"
  #   page.should have_content('Authentication failed.')
  # end
end
