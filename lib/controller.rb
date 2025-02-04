require './lib/gossip'
require './lib/comment'
require 'sinatra/base'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all} 
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    author = params[:gossip_author]
    content = params[:gossip_content]

    gossip = Gossip.new(author, content)
    gossip.save

    redirect '/'
  end

  get '/gossips/:id' do
    gossip = Gossip.find(params[:id])
    comments = Comment.find_by_gossip_id(params[:id])
    if gossip
      erb :show, locals: { gossip: gossip, comments: comments }
    else
      "Potin introuvable !"
    end
  end
  
  get '/gossips/:id/edit/' do
    gossip = Gossip.find(params[:id])
    erb :edit, locals: { gossip: gossip }
  end

  post '/gossips/:id/edit' do
    Gossip.update(params[:id], params[:gossip_author], params[:gossip_content])
    redirect "/"
  end

  post '/gossips/:id/comments' do
    comment = Comment.new(params[:id], params[:comment_content])
    comment.save
    redirect "/gossips/#{params[:id]}"
  end
  
end