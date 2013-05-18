require 'spec_helper'

describe "Tweet" do

  let (:user) { User.create! do |user|
                  user.name = "tune_line"
                end }

  describe "update_tweets" do
    it "has a valid user" do
      expect(user.name).to eq("tune_line")
    end
  end

end
