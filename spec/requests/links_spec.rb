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
  # User should be able to remove bookmarks by clicking a remove link in the bookmark list page
  it 'can delete existing bookmarks' do
    user.youtube_links.create(url: youtube_link.url)

    visit user_path(user)
    click_link 'remove'
    within '#bookmarks' do
      page.should_not have_content youtube_link.url
    end
  end
  # User should be able to remove a large number of bookmarks easily
  it 'can pick and mass-remove links', js: true do
    i = 0
    user.youtube_links.create(url: FactoryGirl.build(:a_link).url) && i+=1 while i<10

    visit user_path(user)

    user.youtube_links.count.should eq(10)
    i=1
    while i < 6
      within "#youtube_link_#{i}" do
        check('delete_youtube_link')
        i+=1
      end
    end
    click_link 'remove marked'
    visit user_path(user)
    user.youtube_links.count.should eq(5)
  end

  # When a user enters a link to be saved from YouTube, she should see the video name and thumbnail automatically as they appear in youtube
  it 'can identify youtube links as special, and attach extra info to them' do
    user.youtube_links.create(url: youtube_link.url)

    visit user_path(user)
    page.should have_selector('img', href: "http://www.youtube.com/watch?v=RvE9Lmzq5aM&feature=g-vrec")
  end

end
