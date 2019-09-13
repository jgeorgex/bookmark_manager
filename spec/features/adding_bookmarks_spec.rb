feature 'adding bookmarks' do
  scenario 'user adds a bookmark' do
    visit('/bookmarks')
    fill_in 'url', with: "http://www.youtube.com"
    click_button 'Add Bookmark'

    expect(page).to have_content("http://www.youtube.com")
  end
  end
