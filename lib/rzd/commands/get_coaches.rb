require 'mechanize'

class Rzd::Commands::GetCoaches

  def initialize
    @agent = Mechanize.new
  end

  def execute( from, to, date, train )
    page = @agent.get "http://pass.rzd.ru/isvp/public/pass/express?route_id=&schd_id=6&action=submit&schd_ref_id=1&refererLayerId=4922&STRUCTURE_ID=735&layer_id=4923&src=#{CGI::escape from}&dst=#{CGI::escape to}&date=#{CGI::escape date}&train=#{CGI::escape train}"
    table = page.parser.css('form table.result').first
    if table
      rows = table.css('tr')
      rows.shift
      rows.shift
      rows.map do |row|
        cells = row.css('td')

        seat_types = [:upper,:lower,:upper_side,:lower_side,:other]
        seats = {}
        cells[7..11].each_with_index do |c,i|
          s = c.text.gsub("\302\240", "").strip.to_i
          seats[seat_types[i]] = s unless s == 0
        end
        seats[:all] = seats.values.inject(0, :+)

        Rzd::Coach.new cells[1].text.strip.gsub(/\n[\s\302\240]+/,' '), cells[5].text.strip, cells[6].text.strip, seats
      end
    else
      []
    end
  end

end
