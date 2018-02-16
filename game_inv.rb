def display_inventory(inventory)
    if inventory.length == 0
        puts "Your inventory is empty"
    else
        puts "Inventory:"
        inventory.each {|key, value| puts "#{value} #{key}"}
        puts "Total number of items: #{inventory.values.sum}"
    end
end

if __FILE__ == $0
    inv = {"apple": 3, "gold coins": 25}
    display_inventory(inv)
end
