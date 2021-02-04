require 'open-uri.rb'

#Uppgift 10

def username_catcher(string)
    matched = string.match(/([a-zA-Z]+:\s*)(\w+)/)
    if (matched != nil)
        return matched[2]
    else
        return "No match"
    end
end

#Uppgift 11

html = open("http://www.google.com/") { |f| f.read }

#puts(html)

def tag_names(html)
    tag_pattern = /<(\w+)/
    matched = html.scan(tag_pattern)
    result = matched.uniq()
    return result
end
    


