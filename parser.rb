require 'rest-client'
require 'json'

def related_concepts_for(query)
    #query should have underscores instead of spaces
    RestClient.get("http://en.wikipedia.org/wiki/#{query}").body.scan(/<a href="\/wiki\/.+\">/).map do |x|
        x.split("title=").last[1..-3]
    end
end

def pruned_concepts_for(query)
    #filters out entries from related_concepts_for(query) that have html markup
    concepts = related_concepts_for(query)
    concepts.reject do |concept|
        concept.count('<') > 0
    end
end

puts pruned_concepts_for('dog')