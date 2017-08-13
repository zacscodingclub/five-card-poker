# Five Card Poker

https://github.com/robolson/ruby-poker/blob/master/examples/deck.rb

## Basic Code Example for 2 Players
```ruby
@cards = []

Card::SUITS.each_byte do |suit|
  Card::FACES[1..-1].each_byte do |face|
    @cards.push(Card.new(face.chr, suit.chr))
  end
end

def shuffle
  @cards = @cards.sort_by { rand }
end

hands = [[], []]

def deal
  5.times do
    hands[0] << @cards.pop
    hands[1] << @cards.pop
  end
end
```
