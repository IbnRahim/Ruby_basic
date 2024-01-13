class Route
  attr_reader :station_list

  def show_station_list
    puts "Данный маршрут состоит из следующих станций"
    @station_list.each.with_index (1) {|station, index| puts "#{index}: #{station.name}"}
  end

  def initialize (station_a, station_z)
    @station_list = [station_a, station_z]
  end

  def add_an_intermediate_station (station)
    @station_list.insert(-2, station)
  end

  def remove_intermediate_station (station)
    return if @station_list.first == station || @station_list.last == station
    @station_list.delete(station)
  end
end