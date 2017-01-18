require 'sinatra'
require 'json'
require 'haml'

enable :inline_templates

def quine
  IO.read($0)
end

get '/code' do
  content_type :json
  { code: quine }.to_json
end

get '/home' do
  haml :index
end

__END__
%html
  = yield

@@ index
%h1 Introduction
%p A quine is a non-empty computer program which takes no input and produces a copy of its own source code as its only output. The standard terms for these programs in the computability theory and computer science literature are "self-replicating programs", "self-reproducing programs", and "self-copying programs".
%div.main-section
%script{ :src => '//ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js', :type => 'text/javascript', :charset => 'utf-8' }
:javascript
    $(document).ready( function() {
      var intervalID = window.setInterval(count, 1000);
      var i = 1;
      function count() {
        if(i > 3) {
          clearInterval(intervalID);
          //call ajax and get quine and show on the div
          //$('.main-section').html(quine);
        }
        else {
          $('.main-section').html(i++);
        }
      }

    } );