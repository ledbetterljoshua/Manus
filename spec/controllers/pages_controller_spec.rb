require 'spec_helper'

describe PagesController do

  describe "GET 'home--skip-assets'" do
    it "returns http success" do
      get 'home--skip-assets'
      response.should be_success
    end
  end

end
