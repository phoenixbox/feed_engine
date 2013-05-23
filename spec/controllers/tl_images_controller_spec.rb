require 'spec_helper'

describe TlImagesController do

  before(:each) do
    @valid_attributes = {tl_image: true}
    @invalid_attributes = {tl_image: false}
    @user = FactoryGirl.create(:user)
    controller.stub(:current_user => @user)
    request.env["HTTP_REFERER"] = '/'
  end


end
