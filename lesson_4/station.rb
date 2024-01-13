class Station
  attr_reader :name, :train_list

  def initialize (name)
  	@name = name
  	@train_list = { cargo: [], passasnger: [] }
  end

  def receives_the_train (train, type)
  	@train_list[type] << train 
  end

  def show_a_list_of_trains_at_the_station
    puts "Список поездов на станции"
  	@train_list.each_value {|type| type.each {|train| puts train.number}}
  end

  def show_train_by_type (type)
  	@train_list[type]
  end

  def send_train (train)
  	@train_list[TRAIN_TYPES[train.class.name]].delete (train)
  end
end