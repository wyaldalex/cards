defmodule Cards do

  @moduledoc """
  Module to create and handle deck of cards
  """

  def hello do
    "hi there!"
  end

  def create_deck do

    values = ["Ace", "Two", "Three","Four","Five"]
    suits = ["Spades", "Clubs", "Hearts","Diamonds"]

    # List.flatten(for suit <- suits do
    #   for value <- values do
    #     {suit,value}
    #   end
    # end)
    for suit <- suits, value <- values do
      {suit,value}
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  #? appended by convetion when boolean is returned
  @doc """
  Check if a hand exists in the deck in the form of a tuple

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,{"Spades", "Ace"})
      true
  """
  def contains?(deck,hand) do
    Enum.member?(deck,hand)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` arguments indicates how many cards
  should be in the hand.

  ## Examples

        iex> deck = Cards.create_deck
        iex> hand = Cards.deal(deck,1)
        iex> hand
        [{"Spades", "Ace"}]
  """
  def deal(deck, hand_size) do
    elem(Enum.split(deck,hand_size),0)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load(filename) do

    case File.read(filename) do
      {:ok, content} -> :erlang.binary_to_term(content)
      {:error, _} -> "Unable to retrieve that file, it may not exist"
    end

  end

  def create_hand(hand_size) do
    Cards.create_deck |>
    Cards.shuffle |>
    Cards.deal(hand_size)
  end


end
