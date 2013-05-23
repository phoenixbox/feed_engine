require 'spec_helper'

feature "authenticated user can add feed_items to their feed" do

  context "when logged in", js: true do

    before(:each) do
      visit 'http://lvh.me:1234/'
      mock_auth_hash
      click_link 'Sign in with Twitter'
      click_link 'My Crate'
    end

    it 'they can login and view their wall' do
      expect(current_path).to eq root_path
    end
  end
end
