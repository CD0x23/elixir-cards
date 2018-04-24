defmodule CardsTest do
  use ExUnit.Case
  # includes code tests inside documentation
  doctest Cards
  
  # case tests
  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
   deck = Cards.create_deck
   refute deck == Cards.shuffle(deck) # same behaviour as below
   # assert deck != Cards.shuffle(deck)  
  end

end