require './lib/gossip'
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
    erb :show, locals: { gossip: gossip }
  end
  
  get '/gossips/:id/edit/' do
    gossip = Gossip.find(params[:id])
    erb :edit, locals: { gossip: gossip }
  end


  post '/gossips/:id/edit' do
    gossip = Gossip.find(params[:id])
    gossip.author = params[:gossip_author]
    gossip.content = params[:gossip_content]
    gossip.save
  
    redirect "/"
  end

end
