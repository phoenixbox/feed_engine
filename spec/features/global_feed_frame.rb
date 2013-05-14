require 'spec_helper'

feature "authenticated user can see the global feed" do

  context "authenticated user visits the root url" do
    before(:each) do
        visit 'http://lvh.me:1234/'
        mock_auth_hash
        click_link 'Sign in with Twitter'
    end

    xit "displays the users name " do
      page.should have_content current_user.name
    end

    xit "redirects to the users page" do
      click_link "Go to my page"
      expect(current_path).to eq user_profile_path(current_user)
    end

    xit "redirects to the linked services page" do
      click_link "Linked Services"
      expect(current_path).to eq account_integration_path(current_user)
    end

    xit "redirects to the manage account page" do
      click_link "Manage Account"
      expect(current_path).to eq account_mgmt_path(current_user)
    end

    xit "redirects to the global feed" do
      click_link "Tuneline"
      expect(current_path).to eq global_feed_path
    end

    xit "page has the global feed" do
      page.should have_css('div#content')
    end

# **************************** Tweet item *******************************

    xit "global feed has a tweet" do
      within(:css, 'div#content') {
        page.should have_css('div#tweet-sample')
      }
    end

    xit "global feed tweet has the tweeters name" do
      within(:css, 'div#tweet-sample') {
        page.should have_content(tweet_item.username)
      }
    end

    xit "global feed tweet has the tweets body" do
      within(:css, 'div#tweet-sample') {
        page.should have_content(tweet_item.body)
      }
    end

    xit "global feed tweet has the tweeters thumbnail" do
      within(:css, 'div#tweet-sample') {
        page.should have_content(tweet_item.thumbnail)
      }
    end

    xit "global feed tweet has a like button" do
      within(:css, 'div#tweet-content') {
        find_link('Like').visible?
      }
    end

    xit "global feed tweet has a Refeed link" do
      within(:css, 'div#tweet-content') {
        find_link('Refeed').visible?
      }
    end

    xit "redirects to the image content show" do
      within(:css, 'ul.dropdown-menu'){
          click_link 'Create New Collection'
        }
        expect(current_path).to eq new_account_collection_path
    end

  end

end

