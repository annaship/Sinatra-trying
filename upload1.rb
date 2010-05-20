require 'rubygems'
require 'sinatra'
require 'haml'

  post '/upload' do
    unless params[:file] &&
           (tmpfile = params[:file][:tempfile]) &&
           (name = params[:file][:filename])
      @error = "No file selected"
      return haml(:upload)
    end
    STDERR.puts "Uploading file, original name #{name.inspect}"
    while blk = tmpfile.read(65536)
      # here you would write it to its final location
      STDERR.puts blk.inspect
    end
    "Upload complete"
  end

# %h1 Upload
# 
# %form{:action=>"/upload",:method=>"post",:enctype=>"multipart/form-data"}
#   %input{:type=>"file",:name=>"file"}
#   %input{:type=>"submit",:value=>"Upload"}
# 
# 

# get '/ura' do
#   haml :upload
# end


# get '/ura' do
#   haml '
#   %h1 Upload
#   %form{:action=>"/upload",:method=>"post",:enctype=>"multipart/form-data"}
#     %input{:type=>"file",:name=>"file"}
#     %input{:type=>"submit",:value=>"Upload"}'
# end

# %h1 Upload
# 
# %form{:action=>"/upload",:method=>"post",:enctype=>"multipart/form-data"}
#   %input{:type=>"file",:name=>"file"}
#   %input{:type=>"submit",:value=>"Upload"}

# #sinatra-test-upload.rb
# require 'rubygems'
# require 'sinatra'
# post '/upload' do
#         File.open("/text_bad.txt","wb") { |f| f.write(params[:datafile]['file'].read) }
# end
# get '/ura' do
#   "URA!"
# end