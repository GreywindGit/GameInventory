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


def print_inventory(inventory)
    amount_offset = inventory.values.map {|x| x.to_s.length}.max + 5
    item_offset = inventory.keys.map {|x| x.length}.max + 5
    puts "Inventory:"
    puts " " * (amount_offset - "count".length) + "count" + 
         " " * (item_offset - "item name".length) + "item name"
    puts "-" * (amount_offset + item_offset)
    for key, value in inventory
        puts " " * (amount_offset - value.to_s.length) + "#{value}" +
             " " * (item_offset - key.length) + "#{key}"
    end
    puts "-" * (amount_offset + item_offset)
    puts "Total number of items: #{inventory.values.sum}"
end


if __FILE__ == $0
    inv = {"apple" => 3, "gold coins" => 25}
    display_inventory(inv)
    add_to_inventory(inv, ["gold coins", "torch", "chalk"])
    display_inventory(inv)
    add_to_inventory(inv, ["apple", "apple", "rope"])
    print_inventory(inv)
end
