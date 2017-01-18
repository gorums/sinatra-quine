require 'sinatra'
require 'json'
require 'haml'

enable :inline_templates

get '/code' do
  content_type :json
  { code: quine }.to_json
end

get '/home' do
  haml :index
end

def quine
  q = "\""
  s = '\''
  n = "\n"
  l = ","

  code = [

      "require 'sinatra'",
      "require 'json'",
      "require 'haml'",
      "",
      "enable :inline_templates",
      "",
      "get '/code' do",
      "  content_type :json",
      "  { code: quine }.to_json",
      "end",
      "",
      "get '/home' do",
      "  haml :index",
      "end",
      "",
      "def quine",
      '  q = "\""',
      "  s = '\\''",
      '  n = "\n"',
      '  l = ","',
      "",
      "  code = [",
      "    ",
      "  ]",
      "",
      "  c = ''",
      "  Range.new(0, 23, true).each do |i|",
      "    c << code[i] + n",
      "  end",
      "  Range.new(0, code.size, true).each do |i|",
      "    d = i == 16 || i == 18 || i == 19 || i == 45 || i == 46 || i == 48 || i == 51 || i == 62 || i == 64 || i == 67 || i == 68 || i == 73 ? s : q",
      "    c << code[21] + d + code[i] + d + l + n",
      "  end",
      "  Range.new(23, code.size, true).each do |i|",
      "    c << code[i] + n",
      "  end",
      "",
      "  c",
      "end",
      "",
      "__END__",
      "%html",
      "  = yield",
      "",
      "@@ index",
      '%script{ :src => "//ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js", :type => "text/javascript", :charset => "utf-8" }',
      '%link{:rel => :stylesheet, :type => :"text/css", :href => "prism.css"}',
      "%h1 Introduction",
      '%p A quine is a non-empty computer program which takes no input and produces a copy of its own source code as its only output. The standard terms for these programs in the computability theory and computer science literature are "self-replicating programs", "self-reproducing programs", and "self-copying programs".',
      "",
      "%pre.line-numbers",
      "  %code.language-ruby",
      '    %div.main-section{ style: "font-size: 100px; text-align:center; color:red;" }',
      "",
      ":javascript",
      "    $(document).ready( function() {",
      "      var intervalID = window.setInterval(count, 1000);",
      "      var i = 3;",
      "      function count() {",
      "        if(i === 0) {",
      "          clearInterval(intervalID);",
      "          $.ajax({",
      '            url: "/code",',
      "            data: {",
      '              format: "json"',
      "            },",
      "            success: function(data) {",
      '                 $(".main-section").replaceWith(JSON.parse(data).code);',
      '                 $.getScript("prism.js");',
      "            }",
      "          })",
      "        }",
      "        else {",
      '          $(".main-section").html(i--);',
      "        }",
      "      }",
      "    } );",
  ]

  c = ''
  Range.new(0, 23, true).each do |i|
    c << code[i] + n
  end
  Range.new(0, code.size, true).each do |i|
    d = i == 16 || i == 18 || i == 19  || i == 45 || i == 46 || i == 48 || i == 51 || i == 62 || i == 64 || i == 67 || i == 68 || i == 73 ? s : q
    c << code[22] + d + code[i] + d + l + n
  end
  Range.new(23, code.size, true).each do |i|
    c << code[i] + n
  end

  c
end

__END__
%html
  = yield

@@ index
%script{ :src => "//ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js", :type => "text/javascript", :charset => "utf-8" }
%link{:rel => :stylesheet, :type => :"text/css", :href => "prism.css"}
%h1 Introduction
%p A quine is a non-empty computer program which takes no input and produces a copy of its own source code as its only output. The standard terms for these programs in the computability theory and computer science literature are "self-replicating programs", "self-reproducing programs", and "self-copying programs".

%pre.line-numbers
  %code.language-ruby
    %div.main-section{ style: "font-size: 100px; text-align:center; color:red;" }

:javascript
    $(document).ready( function() {
      var intervalID = window.setInterval(count, 1000);
      var i = 3;
      function count() {
        if(i === 0) {
          clearInterval(intervalID);
          $.ajax({
            url: "/code",
            data: {
              format: "json"
            },
            success: function(data) {
                 $(".main-section").replaceWith(JSON.parse(data).code);
                 $.getScript("prism.js");
            }
          })
        }
        else {
          $(".main-section").html(i--);
        }
      }
    } );