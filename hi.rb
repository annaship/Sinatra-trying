require 'rubygems'
require 'sinatra'
require 'haml'

get '/hi' do
  "Hello World!"
end
get '/uu' do
    haml '%div.title Hello World!'
end
