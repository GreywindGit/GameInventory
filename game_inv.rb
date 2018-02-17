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


def print_inventory(inventory, order=nil)
    case order
        when "asc"
            inventory = inventory.sort_by{|key, value| value}.to_h
        when "desc"
            inventory = inventory.sort_by {|key, value| value}.reverse.to_h
        end
    amount_offset = inventory.values.map {|x| x.to_s.length}.max + 5
    item_offset = inventory.keys.map {|x| x.length}.max + 7
    puts "Inventory:"
    print_record(amount_offset, item_offset, "count", "item name")
    print_separator(amount_offset + item_offset)
    for key, value in inventory
        print_record(amount_offset, item_offset, value.to_s, key)
    end
    print_separator(amount_offset + item_offset)
    puts "Total number of items: #{inventory.values.sum}"
end


def print_record(offset1, offset2, value1, value2)
    puts " " * (offset1 - value1.length) + "#{value1}" +
         " " * (offset2 - value2.length) + "#{value2}"
end


def print_separator(sep_length)
    puts "-" * sep_length
end


if __FILE__ == $0
    inv = {"apple" => 3, "gold coins" => 25}
    display_inventory(inv)
    add_to_inventory(inv, ["gold coins", "torch", "chalk"])
    display_inventory(inv)
    add_to_inventory(inv, ["apple", "apple", "rope"])
    print_inventory(inv)
end
