class Deck
  attr_reader :cards
  def initialize
    @cards = []
    Card::SUITS.each_byte do |suit|
      # careful not to double include the aces...
      Card::FACES[1..-1].each_byte do |face|
        @cards.push(Card.new(face.chr, suit.chr))
      end
    end
    shuffle
  end

  def shuffle
    @cards = @cards.sort_by { rand }
    return self
  end

  def deal
    @cards.pop
  end
  
  def size
    @cards.size
  end

  def empty?
    @cards.empty?
  end
end
