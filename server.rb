require 'sinatra'
require 'json'
require 'haml'

enable :inline_templates

def quine
  q = <<-FOO
    require 'sinatra'
    require 'json'
    require 'haml'

    enable :inline_templates

    def quine
    end
  FOO
  q
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
%script{ :src => '//ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js', :type => 'text/javascript', :charset => 'utf-8' }
%script{ :src => 'prism.js', :type => 'text/javascript', :charset => 'utf-8' }
%link{:rel => :stylesheet, :type => :"text/css", :href => "prism.css"}
%h1 Introduction
%p A quine is a non-empty computer program which takes no input and produces a copy of its own source code as its only output. The standard terms for these programs in the computability theory and computer science literature are "self-replicating programs", "self-reproducing programs", and "self-copying programs".

%pre.line-numbers
  %code.language-ruby
    %div.main-section

:javascript
    $(document).ready( function() {
      var intervalID = window.setInterval(count, 1000);
      var i = 3;
      function count() {
        if(i === 0) {
          clearInterval(intervalID);
          $.ajax({
            url: '/code',
            data: {
              format: 'json'
            },
            success: function(data) {
                 $('.main-section').replaceWith(JSON.parse(data).code);
            }
          })
        }
        else {
          $('.main-section').html(i--);
        }
      }

    } );