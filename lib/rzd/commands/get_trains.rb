require 'mechanize'

class Rzd::Commands::GetTrains

  def initialize
    @agent = Mechanize.new
  end

  def execute( from, to, date )
    page = @agent.get "http://pass.rzd.ru/isvp/public/pass/isvp/public/rzd/express?schd_id=1&action=submit&layer_id=4922&STRUCTURE_ID=735&src=#{CGI::escape from}&dst=#{CGI::escape to}&date=#{CGI::escape date}"
    table = page.parser.css('form table')[2]
    if table
      rows = table.css('tr')
      rows.shift
      rows.map do |row|
        cells = row.css('td')

        Rzd::Train.new cells[2].text.strip, cells[3].text.strip, get_seats( cells[7..11].text )
      end
    else
      []
    end
  end

  private

  def get_seats( str )
    seats = []
    Rzd::Train::SEATS.each do |s|
      seats << s if str.include? s
    end
    seats
  end

end
