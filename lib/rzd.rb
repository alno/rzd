class Rzd

  module Commands; end

  class << self

    def get_trains( from, to, date )
      require 'rzd/commands/get_trains'

      Rzd::Commands::GetTrains.new.execute( from, to, date )
    end

    def get_coaches( from, to, date, train )
      require 'rzd/commands/get_coaches'

      Rzd::Commands::GetCoaches.new.execute( from, to, date, train )
    end

  end
end

require 'rzd/train'
require 'rzd/coach'
