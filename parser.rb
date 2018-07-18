require 'rest-client'
def all_links_for(query)
    #query should have underscores instead of spaces, otherwise it will 404
    #todo: handle query formatting. query is case-sensitive, and capitalize will not always work
    RestClient.get("http://en.wikipedia.org/wiki/#{query}").body.scan(/<i><a href=".+<\/a><\/i>/).map{|x|x.split(' ')[1][7..-2]}
    end
end

puts all_links_for('Kevin Bacon')
