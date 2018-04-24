defmodule Cards do
  
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}" 
    end  
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do

    case File.read(filename) do # pattern matching instead of if statement
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist" # underscore before the variable we don't care about
    end

  end
  
  def create_hand(hand_size) do

#   deck = Cards.create_deck
#   deck = Cards.shuffle(deck)
#   hand = Cards.deal(deck, hand_size)  

    # doing the same thing above but with the pipe operator
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)

  end
end
