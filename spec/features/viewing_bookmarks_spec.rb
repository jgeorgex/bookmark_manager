require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname:'bm_manager_test')

    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "DAS")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit('/bookmarks')

    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'DAS'
    expect(page).to have_content 'Google'
  end
end
