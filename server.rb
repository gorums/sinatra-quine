require 'sinatra'
require 'json'

def quine
  IO.read($0)
end

get '/code' do
  content_type :json

  { code: quine }.to_json
end

get '/home' do
  'Hello world!'
end