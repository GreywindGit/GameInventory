def display_inventory(inventory)
    if inventory.length == 0
        puts "Your inventory is empty"
    else
        puts "Inventory:"
        inventory.each {|key, value| puts "#{value} #{key}"}
        puts "Total number of items: #{inventory.values.sum}\r\n"
    end
end


def add_to_inventory(inventory, added_items)
    for item in added_items
        if inventory.key?(item)
            inventory[item] += 1
        else
            inventory[item] = 1
        end
    end
end


if __FILE__ == $0
    inv = {"apple" => 3, "gold coins" => 25}
    display_inventory(inv)
    add_to_inventory(inv, ["gold coins", "torch", "chalk"])
    display_inventory(inv)
    add_to_inventory(inv, ["apple", "apple", "rope"])
    print_inventory(inv)
end
