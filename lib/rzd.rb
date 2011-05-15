class Rzd

  module Commands; end

  class << self

    def get_trains( from, to, date )
      require 'rzd/commands/get_trains'

      Rzd::Commands::GetTrains.new.execute( from, to, date )
    end

  end
end

require 'rzd/train'
