defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "truthy truth" do
    assert 1 == 1
  end

  test " create_deck makes 20 cards" do
    deck_lenth = length(Cards.create_deck)
    assert deck_lenth == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end

end
