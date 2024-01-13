class Train 
  attr_reader :railway_carriages, :number, :speed, :type

  TRAIN_TYPES =     {
      'CargoTrain'     => :cargo,
      'PassengerTrain' => :passanger
  }

  def initialize (number, type = :cargo)
    @number = number 
    @speed = 0
    @railway_carriages = []
  end

  def stop
    @speed = 0
  end

  def attach_a_wagon (wagon)
    @railway_carriages << wagon
  end

  def unhook_the_wagon (wagon)
    @railway_carriages.delete (wagon)
  end

  def take_route (route)
    @route = route

    route.station_list.first.receives_the_train(self, TRAIN_TYPES[self.class.name])
    @position = 0
  end

  def currrent_station
    @route.station_list[@position]
  end

  def next_station
    if last_station?
      puts "Данная станция последняя"
    else
      @route.station_list[@position + 1]
    end
  end

  def pervious_station
    if first_station?
      puts "Данная станция первая"
    else
      @route.station_list[@position - 1]
    end
  end

  def moving_to_the_next_station
    if @route && !last_station?
      currrent_station.send_train(self)
      next_station.receives_the_train(self)
      @position += 1
    end
  end

  def moving_to_the_previous_station
    if @route && !first_station?
      currrent_station.send_train(self)
      pervious_station.receives_the_train(self)
      @position -= 1
    end
  end
protected
#Ниже следующие методы испольлзуются лишь внутри класса , по крайней мере пока что. 
attr_writer :speed

  def last_station?
    @route.station_list.last == currrent_station
  end

  def first_station?
    @route.station_list.first == currrent_station
  end

  def show_the_position_of_the_train_on_the_route
    location = []
    @route.station_list.each do |station|
      if station.train_list.include?(self)
        location << station
      end
    end
  end
end