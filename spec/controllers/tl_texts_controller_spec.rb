require 'spec_helper'

describe TlTextsController do

  describe 'POST#create' do
    before(:each) do
      @valid_attributes = { tl_text: {content: "sample input"}}
      @invalid_attributes = { tl_text: {content: ""} }
      @user = FactoryGirl.create(:user)
      controller.stub(:current_user => @user)
      request.env["HTTP_REFERER"] = '/'
    end

    it 'increases the tl_texts by 1 with valid attributes' do
      expect {post :create, @valid_attributes}.to change(FeedItem, :count).by(1)
    end
  end
end