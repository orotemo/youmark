require 'spec_helper'

describe "Welcomes" do
  describe "user visiting root" do
    let(:user) { FactoryGirl.build :user }
    before { visit root_path }
    # User should be able to open site and see a welcome screen
    it "greeted with 'YouMark'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      page.should have_content('YouMark')
    end

    # User should be able to register
    it 'is allowed to register' do
      page.should have_link('register')
      click_link 'register'
      register_user(user)
    end
  end
end
