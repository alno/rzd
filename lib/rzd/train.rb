class Rzd::Train < Struct.new(:num,:name,:seats)

  SEATS = ['Л','К','П','С']

  def seat_table
    str = ""
    SEATS.each do |s|
      str += seats.include?(s) ? s : " "
      str += " "
    end
    str
  end

end
