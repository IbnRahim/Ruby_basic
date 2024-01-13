require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'route'
require_relative 'railway_carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'

#Практически финальная версия , но конечно можно ещё что-то чуть более рациональней сделать.

all_available_stations = {}
created_train = {}
all_available_route = {}
created_carriage = {}
train_involved = {}
carriage_involved = {}

loop do

    puts "#Menu
    1. Создать станцию.
    2. Создать поезд.
    3. Создать маршрут.
    4. Управлять станциями на маршруте.
    5. Назначать маршрут поезду. 
    6. Создание вагонов и управление ими.
    7. Перемещать поезд по маршруту.
    8. Посмотреть список станций и посмотреть список поездов на станции. 
    0. Завершить работу."

    enter = gets.chomp.to_i

    case enter 
    #1. Создать станцию
    when 1
        puts 'Введите имя станции.'
        input = gets.chomp
        if all_available_stations.keys.include?(input)
            puts 'Станция с таким именем уже есть.'
        else
            all_available_stations[input] = Station.new(input)
            all_available_stations.values.each {|station| puts station.inspect}
        end
    #2. Создать поезд
    when 2
  	    puts 'Введите номер для поезда.'
  	    input1 = gets.chomp
        if created_train.keys.include?(input1)
            puts 'Поезд с таким номером уже есть.'
        else
            puts '
            1. Создать пассажирский поезд.
            2. Создать грузовой поезд.'
            input2 = gets.chomp.to_i
            case input2
            when 1
                created_train[input1] = PassengerTrain.new(input1)
            when 2
                created_train[input1] = CargoTrain.new(input1)
            end
            puts created_train.values.each {|train| puts train.inspect}
        end
    #3.Создать маршрут
    when 3 
        puts 'Введите названия первой станции.'
        input1 = gets.chomp
        puts 'Введите название последней станции.'
        input2 = gets.chomp
        puts 'Введите именной номер для пути.'
        input3 = gets.chomp
        if all_available_route.keys.include?(input)
            puts 'Путь под таким номером уже есть.'
        else
            all_available_route[input3] = Route.new(all_available_stations[input1], all_available_stations[input2])
            puts all_available_route.values.each {|route| puts route.inspect}
        end
    #4 Управлять станциями в нем (добавлять и удалять)
    when 4
  	    puts '
  	    1. Добавить станцию в маршрут.
  	    2. Убрать станцию с маршрута.'
  	    input = gets.chomp.to_i
  	    puts 'Введите именной номер нужного маршрута.'
        all_available_route.each {|key, value| puts "#{key} = #{value.station_list}"}
  	    title1 = gets.chomp
  	    puts 'Введите название станции которую хотите добавить.'
        puts all_available_stations.keys
  	    title2 = gets.chomp
  	    case input 
        when 1
            if all_available_route[title1].station_list.include?(all_available_stations[title2])
                puts 'В данном маршруте уже есть такая станция.'
            else
                all_available_route[title1].add_an_intermediate_station(all_available_stations[title2])
            end
  	    when 2
  	 	    all_available_route[title1].remove_intermediate_station(all_available_stations[title2])
        else
            puts 'Дебил, ты в своём уме ? Нормально выбирай из того что написано !'
  	    end
        puts all_available_route[title1].station_list.inspect
    #5.Назначать маршрут поезду
    when 5
   	    puts 'Введите именной номер нужного маршрута.'
        all_available_route.each {|key, value| puts "#{key} = #{value.station_list}"}
  	    title1 = gets.chomp
  	    puts 'Введите номер поезда.'
        puts created_train.keys
  	    title2 = gets.chomp
        created_train[title2].take_route(all_available_route[title1])
        train_involved[title2] = created_train[title2]
        created_train.delete(title2)
        puts train_involved[title2].inspect
    #6. Создание вагонов и управление ими.
    when 6
   	    puts '
        1. Создать вагон.
        2. Управлять вагонами'
   	    input1 = gets.chomp.to_i
        case input1
        when 1
            puts 'Введите номер для вагона.'
            title1 = gets.chomp
            if created_carriage.keys.include?(title1)
                puts 'Вагон под таким номером уже есть.'
            else
                puts '
                1. Создать пассажирский вагон.
                2. Создать грузовой вагон.'
                input2 = gets.chomp.to_i
                case input2
                when 1
                    created_carriage[title1] = PassengerCarriage.new(title1)
                when 2
                    created_carriage[title1] = CargoCarriage.new(title1)
                end
            end
  	    when 2
            puts '
            1. Прицепить вагон.
            2. Отцепить вагон.'
            input3 = gets.chomp.to_i
            puts 'Введите номер нужного вагона.'
            puts created_carriage.inspect
            title1 = gets.chomp
            puts 'Введите номер нужного поезда.'
            puts train_involved.inspect
            title2 = gets.chomp
            case input3
            when 1 
                train_involved[title2].attach_a_wagon(created_carriage[title1])
                carriage_involved[title1] = created_carriage[title1]
                created_carriage.delete(title1)
            when 2
                train_involved[title2].unhook_the_wagon(carriage_involved[title1])
                created_carriage[title1] = carriage_involved[title1]
                carriage_involved.delete(title1)
            end
  	    end
    #7. Перемещать поезд по маршруту вперёд и назад.
    when 7
        puts 'Введите номер поезда'
        title = gets.chomp
        puts '
        1. Двигать поезд вперёд.
        2. Двигать поезд назад.'
        input = gets.chomp.to_i
        case input
        when 1
     	    train_involved[title].next_station
        when 2
     	    train_involved[title].pervious_station
        end
        puts " Текущая станция : 
        #{train_involved[title].currrent_station.inspect}"
    #8. Просматривать список станций и список поездов на станции.
    when 8
   	    puts '
   	    1. Список всех станций.
   	    2. Список поездов на указанной станции.'
   	    input = gets.chomp.to_i
   	    case input
        when 1
   	        all_available_stations.values.each {|value| puts value.inspect}
   	    when 2
   	 	    puts 'Введите название станции.'
   	 	    title = gets.chomp
            if all_available_stations[title].train_list.any? 
                all_available_stations[title].show_a_list_of_trains_at_the_station
            else
                puts 'На станции нет поездов.'
            end
   	    end
    end
    break if enter == 0
end