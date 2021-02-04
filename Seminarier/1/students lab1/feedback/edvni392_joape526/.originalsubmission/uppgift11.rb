require 'open-uri.rb'

def tag_names(site)

    #Regex uttryck
    re = /(?<=<)([a-zA-Z]{1,}).*?(?=>)/

    #Finner alla matchning till regex, placeras i array
    tagArray = site.scan(re)
    #Tar bort alla dubbletter
    tagArray.uniq

end

site = open("http://www.google.com/") { |f| f.read }

tag_array = tag_names(site)
