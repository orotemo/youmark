module SpecUtilities
  def register_user(user)
    page.should have_selector('#registration')
    within('#registration') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password_confirmation

      click_button 'Register'
    end

    def login_user(user)
      page.should have_selector('#login')
      within('#login') do
        fill_in 'session_email', with: user.email
        fill_in 'session_password', with: user.password

        click_button 'Login'
      end
    end

    def logout
      click_link 'logout'
    end
  end
end
