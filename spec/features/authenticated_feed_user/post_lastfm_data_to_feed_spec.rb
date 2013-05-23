require 'spec_helper'

feature "authenticated user can add feed_items to their feed" do

  context "when logged in", js: true do

    before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link 'Sign in with Twitter'
      click_link 'My Account'
      click_link first("Integrate").click
      click_link 'My Feed'
    end

    it 'they can login and view their wall' do
      expect(current_path).to eq root_path
    end

    it 'they can see their top tracks lastfm data' do
      expect(page).to have_content('Small_note')
    end

    it 'they can see their top albums lastfm data' do
      expect(page).to have_content('Rank')
    end 

    it 'they can see their top artists' do
      expect(page).to have_content('Small_mike')
    end
  end
end
