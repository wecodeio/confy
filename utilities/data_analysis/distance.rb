# frozen_string_literal: true

clazz = Speaker
field = "name"


items = clazz.all
total = items.size
steps = total / 20.0

pairs = []
(0..(total - 1)).each do |i|
    ((i+1)..(total - 1)).each do |j|
        p1 = items[i]
        p2 = items[j]
        d = Edits::Levenshtein.distance(p1[field], p2[field])
        pairs << OpenStruct.new(item1: p1, item2: p2, distance: d) if d < 3
    end
    # printf("\rProgress: [%-20s]", "=" * (i/steps))
    # puts
end


puts "Informe para #{clazz} por #{field}"
tp pairs.sort { |a, b| b.distance <=> a.distance }, "distance", "item1.id", "item2.id", "item1.#{field}", "item2.#{field}"