module GamesHelper
  SUITS = {
    "D" => { "name":"diams", "color":"red" },
    "C" => { "name":"clubs", "color":"black" },
    "H" => { "name":"hearts", "color":"red" },
    "S" => { "name":"spades", "color":"black" }
  }

  def display_player(player)
    html = ""

    html += <<-HTML
      <div class="player">
        <h3>#{player.name}</h3>
        #{display_hand(player.current_hand)}
      </div>
    HTML

    html.html_safe
  end

  def display_hand(hand)
    html = ""

    hand.format_cards.each do |card|
      value, suit = card.split('')

      html += <<-HTML
        <div class="card-small">
          <p class="card-text #{SUITS[suit][:color]}">#{value}</p>
          <p class="card-img #{SUITS[suit][:color]}">&#{SUITS[suit][:name]};</p>
        </div>
      HTML
    end

    html.html_safe
  end
end
