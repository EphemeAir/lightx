require_relative 'functions'

parents = find_parents("Albert Einstein")


parent = parents.first["title"]

p parent

sur_parents_1 = find_parents(parent)

p sur_parents_1.first["title"]
