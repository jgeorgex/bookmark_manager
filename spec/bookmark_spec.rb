require 'pg'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bm_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com','DAS');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

    bookmarks = Bookmark.all

    expect(bookmarks[0].url).to include('http://www.makersacademy.com')
    expect(bookmarks[1].url).to include('http://www.destroyallsoftware.com')
    expect(bookmarks[2].url).to include('http://www.google.com')
  end
end

describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmarks' )
    bookmarks = Bookmark.all
    expect(bookmarks.first.url).to include 'http://www.testbookmark.com'
    expect(bookmarks.first.title).to include 'Test Bookmarks'
  end
end
