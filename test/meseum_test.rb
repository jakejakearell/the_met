require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron.rb'
require './lib/exhibit.rb'
require './lib/museum.rb'


class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @patron1 = Patron.new("Bob", 20)
    @patron2 = Patron.new("Sally", 20)
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_attributes
    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits
  end

  def test_it_can_add_exhibits
    assert_equal [], @dmns.exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_it_can_recommend
    @patron1.add_interest("Dead Sea Scrolls")
    @patron1.add_interest("Gems and Minerals")
    @patron2.add_interest("IMAX")

    assert_equal [@dead_sea_scrolls, @gems_and_minerals], @dmns.recommend_exhibits(@patron1)
    assert_equal [@imax], @dmns.recommend_exhibits(@patron2)
  end
end
