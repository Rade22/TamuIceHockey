# frozen_string_literal: true

# helper for games module
module GamesHelper
  def game_identity(game)
    "#{game.against_team}"
  end

  def game_date(game)
    "(#{game.date.strftime('%m-%d-%y')})"
  end

  def us_states
    [
      ['Please Choose a State...'],
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Alberta', 'AB'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['British Columbia', 'BC'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Manitoba', 'MB'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Brunswick', 'NB'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Nova Scotia', 'NS'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Ontario', 'ON'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Prince Edward Island', 'PE'],
      ['Puerto Rico', 'PR'],
      ['Quebec', 'QC'],
      ['Rhode Island', 'RI'],
      ['Saskatchewan', 'SK'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY'],
      ['International', 'Int.'],
    ]
  end
end
