feature 'adding bookmarks' do
  scenario 'user adds a bookmark' do
    visit('/bookmarks')
    fill_in 'url' , with: "http://www.youtube.com"
    fill_in 'title' , with: "You Tube"
    click_button 'Add Bookmark'

    expect(page).to have_link("You Tube", href: "http://www.youtube.com")
  end
  end
