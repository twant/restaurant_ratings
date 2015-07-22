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

end