require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks/new' do
    url = params[:url]
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
