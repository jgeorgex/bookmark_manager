require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'bm_manager_test')
connection.exec("TRUNCATE bookmarks;")
