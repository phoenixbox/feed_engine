require 'spec_helper'

describe TlLinksController do

  describe 'POST#create' do
    
    before(:each) do
      @valid_attributes = { tl_link: { link: "http://www.valid.com", content: "loop loop"}}
      @bad_link = {tl_link: { link: "www.invalid", content: "example"} }
      @bad_content = {tl_link: { link: "www.valid.com", content: ""}}
      @user = FactoryGirl.create(:user)
      controller.stub(:current_user => @user)
      request.env["HTTP_REFERER"] = '/'
    end

    it 'increases the tl_texts by 1 with valid attributes' do
      expect {post :create, @valid_attributes}.to change(FeedItem, :count).by(1)
    end

    xit 'does not increase the tl_texts by 1 with a bad_link' do
      expect {post :create, @bad_link}.to change(FeedItem, :count).by(0)
    end
  end

end