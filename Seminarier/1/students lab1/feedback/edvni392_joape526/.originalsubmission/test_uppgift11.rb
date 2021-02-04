require "test/unit"
require "./uppgift11.rb"

class TestFaculty < Test::Unit::TestCase
  
  def test_match 

    large_string = "<html lang=\"en\">
    <head>
      <meta charset=\"utf-8\">
      <title>The HTML5 Herald</title>
      <meta name=\"description\" content=\"The HTML5 Herald\">
      <meta name=\"author\" content=\"SitePoint\">
      <link rel=\"stylesheet\" href=\"css/styles.css?v=1.0\">
    </head>
    <body>
      <script src=\"js/scripts.js\"></script>
    </body>
    </html>"

    assert_equal("html", tag_names("<html>").join)
    assert_equal("img", tag_names("<img attribute något hej>>>").join)
    assert_equal("br", tag_names("76yu2ibr2ir<br>oirn2oinr2oi").join)
    #Jämför antalet unika taggar, sju befinner i strängen
    assert_equal(7, tag_names(large_string).length)

  end
end
