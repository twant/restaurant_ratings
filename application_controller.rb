require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  get '/about.erb' do
    erb :about
  end
  get '/contact.erb' do
    erb :contact
  end
  post '/result' do
    first_choice=params[:first]
    second_choice=params[:second]
    third_choice=params[:third]
    results_hash = get_rating(first_choice, second_choice, third_choice)
    @results=results_hash.to_a.join
    erb :results
  end
  
  post '/return' do
    erb :index
  end
  get '/user_rating.erb' do
    erb :user_rating
  end
  post '/rate' do
    r=params[:restaurant]
    p=params[:price].to_i
    q=params[:quality].to_i
    w=params[:time].to_i
    price=100*Math.exp(-p/32)
    time=100*Math.exp(-w/60)
      $restaurants[r]={
        :price=>price,
        :quality=>q,
        :waittime=>time
        }
    erb :rate_thanks
  end
end