require 'spec_helper'

describe TlLinksController do

  describe 'POST#create' do
    
    before(:each) do
      @valid_attributes = { tl_link: { link: "www.valid.com", content: "loop loop"}}
      @bad_link = {tl_link: { link: "ww.invalid", content: ""} }
      @bad_content = {tl_link: { link: "www.valid.com", content: ""}}
    end

    it 'increases the tl_texts by 1 with valid attributes' do
      expect {post :create, @valid_attributes}.to change(TlLink, :count).by(1)
    end
  end

end