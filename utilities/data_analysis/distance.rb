# frozen_string_literal: true

clazz = Speaker
field = "name"

THRESHOLD = 5

items = clazz.all
total = items.size
steps = total / 20.0

by_size = items.group_by { |s| s.name.length }
pairs = []
(0..(by_size.keys.size - 1)).each do |k|
    interesting_values = []
    ((-[k, THRESHOLD - 1].min)..0).each do |p|
        interesting_values << by_size[by_size.keys.sort[k + p]]
    end
    (0..interesting_values.length - 1).each do |o|
        (0..(interesting_values[o].length - 1)).each do |i|
            d = 0
            ((i+1)..(interesting_values[interesting_values.length - 1].length - 1)).each do |j|
                p1 = interesting_values[o][i]
                p2 = interesting_values[interesting_values.length - 1][j]
                d = Edits::Levenshtein.distance_with_max(p1.levenshtein_name, p2.levenshtein_name, THRESHOLD + 1)
                pairs << OpenStruct.new(item1: p1, item2: p2, distance: d) if d < THRESHOLD
            end
        end
    end
end
pairs.sort_by!(&:distance)


puts "Informe para #{clazz} por #{field}"
tp pairs.sort { |a, b| b.distance <=> a.distance }, "distance", "item1.id", "item2.id", "item1.#{field}", "item2.#{field}"