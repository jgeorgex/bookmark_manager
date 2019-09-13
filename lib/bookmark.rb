require 'pg'

class Bookmark

  attr_reader :id
  attr_reader :title
  attr_reader :url

  def initialize(id:,title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bm_manager_test')
    else
      connection = PG.connect(dbname: 'bm_manager')
    end

    result = connection.exec("SELECT *  FROM bookmarks;")
    result.map { |bookmark|
    Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
 end

   def self.create(url:, title:)
     if ENV['ENVIRONMENT'] == 'test'
       connection = PG.connect(dbname: 'bm_manager_test')
     else
       connection = PG.connect(dbname: 'bm_manager')
     end

     connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title")
   end
end
