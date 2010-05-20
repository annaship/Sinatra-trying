require 'rubygems'
require 'sinatra'
require 'haml'
  # 
  post '/upload' do
    puts "*" * 80
    puts params.inspect.to_s
    puts "=" * 80
# {"file1"=>{:type=>"text/plain", :name=>"file1", :filename=>"text_bad11.txt", :tempfile=>#<File:/var/folders/wq/wqTzo7SOHx4V9VsmKFOn5k+++TM/-Tmp-/RackMultipart20100517-2485-76ca4e-0>, :head=>"Content-Disposition: form-data; name=\"file1\"; filename=\"text_bad11.txt\"\r\nContent-Type: text/plain\r\n"}, "file2"=>{:type=>"text/plain", :name=>"file2", :filename=>"text_good11.txt", :tempfile=>#<File:/var/folders/wq/wqTzo7SOHx4V9VsmKFOn5k+++TM/-Tmp-/RackMultipart20100517-2485-dfl84x-0>, :head=>"Content-Disposition: form-data; name=\"file2\"; filename=\"text_good11.txt\"\r\nContent-Type: text/plain\r\n"}}
    
    unless params[:file1] && params[:file2] &&
           (tmpfile1 = params[:file1][:tempfile]) &&
           (name1 = params[:file1][:filename])
           (tmpfile2 = params[:file2][:tempfile]) &&
           (name2 = params[:file2][:filename])
      @error = "No file selected"
      return haml(:upload)
    end
    STDERR.puts "Uploading file, original name #{name1.inspect}"
    STDERR.puts "Uploading file, original name #{name2.inspect}"
    while blk1 = tmpfile1.read(65536)
      # here you would write it to its final location
      STDERR.puts blk1.inspect
    end
    while blk2 = tmpfile2.read(65536)
      # here you would write it to its final location
      STDERR.puts blk2.inspect
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


get '/' do
  haml '
%h1 Upload
%form{:action=>"/upload",:method=>"post",:enctype=>"multipart/form-data"}
  %input{:type=>"file",   :name=>"file1"}
  %input{:type=>"file",   :name=>"file2"}
  %input{:type=>"submit", :value=>"Upload"}'
end

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