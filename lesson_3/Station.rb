class Station
  attr_reader :name, :train_list

  def initialize (name)
  	@name = name
  	@train_list = []
  end

  def receives_the_train (train)
  	@train_list << train
  end

  def show_a_list_of_trains_at_the_station
    puts "Список поездов на станции"
  	@train_list.each {|train| puts train.number}
  end

  def show_train_by_type (type)
  	@train_list.each {|train| train_by_type = [] << train if train.type == type}
    train_by_type.inspect
  end

  def send_train (train)
  	@train_list.delete (train)
  end
end