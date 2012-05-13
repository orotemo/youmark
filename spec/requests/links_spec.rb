require 'spec_helper'

describe "Links" do
  let(:user) { FactoryGirl.create(:user) }
  let(:youtube_link) { FactoryGirl.build :youtube_link }
  before do
    visit login_path
    login_user(user)
  end

  subject { user }
  # User should be able to submit new links to his personal list
  it 'can submit new links to you mark' do
    page.should have_selector('#youtube_link_url')
    within '#new_youtube_link' do
      fill_in 'youtube_link_url', with: youtube_link.url

      click_button 'Add'
    end

    page.should have_content youtube_link.url
  end
  # User should see all previously submitted links in a table
  it 'can see already submitted links' do
    user.youtube_links.create(url: youtube_link.url)
    logout
    visit login_path
    login_user(user)

    page.should have_content youtube_link.url
  end

end
