#Uppgift 10
def findUserName(name)
    return name.match(/([a-zA-Z\d\b]+:\s)(\s*\w+)/)[2]
end

regexname = findUserName("Username: Michael")

puts regexname

#Uppgift 11

def tagNames(url)
    require 'open-uri.rb'
    siteToSearch = open(url) { |f| f.read }
    tagFound = siteToSearch.scan(/<[^\s\\]+?>/).uniq
 
    tagFoundClean=[]

    tagFound.each do | lm | 
        lm=lm.gsub(/[<\/>]+?/, "")
        tagFoundClean.append(lm)
    end
    
    return tagFoundClean.uniq
end

print tagNames("http://www.google.com/")