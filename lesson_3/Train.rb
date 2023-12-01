class Train
  attr_accessor :speed
  attr_reader :railway_carriage, :type, :number

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
    @railway_carriage = @railway_carriage -= 1 if @speed == 0 && railway_carriage > 0
  end

  def take_route (route)
    @route = route
    route.station_list.first.receives_the_train(self)
    @position = 0
  end

  def currrent_station
    @route.station_list[@position]
  end

  def last_station?
    @route.station_list.last == currrent_station
  end

  def first_station?
    @route.station_list.first == currrent_station
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

  def show_the_position_of_the_train_on_the_route
    location = []
    @route.station_list.each do |station|
      if station.train_list.include?(self)
        location << station
      end
    end