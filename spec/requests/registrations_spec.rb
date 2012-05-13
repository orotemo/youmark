require 'spec_helper'

describe "Registrations" do
  let(:user) { FactoryGirl.build :user }
  # User should be able to register and then login/logout
  # User should be logged in automatically after registration 
  # User should see his personal bookmark list page after login (an empty page as we have no way to insert links yet) 
  describe 'using valid user data' do
    it 'can login/logout' do
      visit new_user_path
      register_user(user)
      page.should have_link('logout')
      click_link 'logout'

      page.should have_link('login')
      page.should have_link('register')

      click_link 'login'

      login_user(user)

      page.should have_content('You Mark')
    end
  end
end
