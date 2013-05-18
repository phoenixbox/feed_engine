require 'spec_helper'

describe TlImagesController do

  before(:each) do
    @valid_attributes = { tl_image: { tl_image: true, content: "loop loop" }}
    @valid_attributes = {tl_image: {tl_image: false, content: ""}}
    @user = FactoryGirl.create(:user)
    controller.stub(:current_user => @user)
    request.env["HTTP_REFERER"] = '/'
  end

  it 'increases the FeedItems by 1 with valid attributes' do
    expect {post :create, @valid_attributes}.to change(FeedItem, :count).by(1)
  end

  it "does not increase the FeedItems by 1 with invalid attributes" do
    expect{post :create, @invalid_attributes}.to raise_exception(ActiveRecord::RecordInvalid)
  end

end
