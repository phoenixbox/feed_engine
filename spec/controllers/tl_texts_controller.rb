require 'spec_helper'

describe TlTextsController do

  describe 'POST#create' do
    
    before(:each) do
      @valid_attributes = { tl_link: { link: "www.valid.com", content: "loop loop"}}
      @bad_link = {tl_link: { link: "ww.invalid", content: ""} }
      @bad_content = {tl_link: { link: "www.valid.com", content: "Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit."}}
    end

    it 'increases the feeds by 1 with valid attributes' do
      expect {post :create, @valid_attributes}.to change(TlLink, :count).by(1)
    end
  end

end