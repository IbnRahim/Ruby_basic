class Station
  attr_reader :name
  attr_reader :train_list

  def initialize (name)
  	@name = name.to_s
  	@train_list = []
  end

  def receives_the_train (train)
  	@train_list << train
  end

  def show_a_list_of_trains_at_the_station
    puts "Список поездов на станции"
  	@train_list.each {|train| puts train.number}
  end

  def show_train_types
  	cargo = 0
  	passenger = 0
  	@train_list.each do |train|
  	  if train.type == :cargo
  	  	cargo += 1
  	  else
  	  	passenger += 1
  	  end
  	end
  	puts "Количество грузовых поездов на станции : #{cargo} ; 
  	количество пассажирских поездов на станции : #{passenger}"
  end

  def send_the_train (number)
  	@train_list.delete_if {|train| train.number == number}
  end
end

class Route
  attr_reader :station_list

  def initialize (station_a, station_z)
    @station_list = []
    @station_list << station_a
    @station_list << station_z
  end

  def add_an_intermediate_station (name_station)
    @station_list.insert(-2, name_station)
  end

  def remove_intermediate_station (name_station)
    @station_list.delete_if {|station| station.name == name_station &&
      station != @station_list.first && station != @station_list.last}
    end

  def show_station_list
    puts "Данный маршрут состоит из следующих станций"
    @station_list.each {|station| puts station.name}
  end
end

class Train
  attr_accessor :speed
  attr_reader :railway_carriage
  attr_reader :number
  attr_reader :type

  def initialize (number, type = :cargo, railway_carriage)
    @number = number 
    @type = if type == "passenger" then :passenger else @type = :cargo end
    @railway_carriage = railway_carriage
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def attach_a_wagon
    @railway_carriage = @railway_carriage += 1 if @speed == 0
  end

  def unhook_the_wagon
    @railway_carriage = @railway_carriage -= 1 if @speed == 0
  end

  def take_route (route)
    @route = route
    route.station_list.first.receives_the_train(self)
  end

  def moving_to_the_next_station
    location = self.show_the_position_of_the_train_on_the_route
    location.each {|station| station.send_the_train(self.number) if station.train_list.include?(self)}
    location.last.receives_the_train(self)
  end

  def moving_to_the_previous_station
    location = self.show_the_position_of_the_train_on_the_route
    location.each {|station| station.send_the_train(self.number) if station.train_list.include?(self)}
    location.first.receives_the_train(self)
  end

  def show_the_position_of_the_train_on_the_route
    location = []
    @route.station_list.each do |station|
      if station.train_list.include?(self)
        location << station
      end
    end
    position = @route.station_list.index (location.first)
    location.insert(0, @route.station_list[position - 1])
    location.insert(-1, @route.station_list[position + 1])
  end
end










