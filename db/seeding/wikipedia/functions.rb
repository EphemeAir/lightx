require 'json'
require 'open-uri'

def find_parents(research)
  to_search = URI.escape(research)
  api_query_categories_path = 'https://fr.wikipedia.org/w/api.php?action=query&format=json&prop=categories&clprop=hidden&cllimit=100&titles='

  complete_uri = api_query_categories_path.to_s + to_search.to_s
  wiki_read = open(complete_uri).read
  document = JSON.parse(wiki_read)

  categories = document['query']['pages'].first[1]['categories']
  clear_categories = []
  if categories
    categories.each do |category|
      clear_categories << category if !category["hidden"]
    end
    return clear_categories
  else
    error = {message: "no category for this research : '#{to_search}'"}
    puts error[:message]
    clear_categories
  end
end
