require 'test/unit'
require './game_inv'

class GameInvTests < Test::Unit::TestCase

    def setup
        @inv = {"rope" => 1}
    end

    def test_add_item_increases_total_amount
        add_to_inventory(@inv, ["pear"])
        expected = 2
        actual = @inv.values.sum
        assert_equal(expected, actual)
    end

    def test_add_item_adds_proper_key
        add_to_inventory(@inv, ["pear"])
        expected = true
        actual = @inv.key?("pear")
        assert_equal(expected, actual)
    end

    def test_add_item_increases_amount_properly
        add_to_inventory(@inv, ["rope", "rope"])
        expected = 3
        actual = @inv["rope"]
        assert_equal(expected, actual)
    end

end