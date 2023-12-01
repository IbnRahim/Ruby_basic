#Сумма покуп
#Приветствие к вводу .
#Создаем пустой хэш "корзина" и создаем константу для начального значения стоимости всех покупок ,
#создаем переменную "сумма цен" со значением константы .
#Делаем цикл loop с блоком . В нем запрашиваем поочерёдно три необходимых параметра ,
#до тех пор пока пользователь не остановит цикл ключевым словом.
#Там же в цикле , полученные параметры закидываем в заранее созданый , пустой хэш . При чем , название товара -- ключ , 
# а цена и кол-во как значение в виде вложеного хэша .
#Применяя метод each к нашему хэшу , перебираем каждый ключ product_name и его значение в виде вложенного хэша .
#Затем вычисляем price * quantity для каждого вложенного хэша и выводим общую стоимость каждого товара.
#И наконец каждое произведение (price * quantity) складываем в заранее созданную переменную sum_of_prices.  


puts "Приветсвуем ! Введите название товара который желаете поместить в корзину , его цену за штуку и кол-во таких товаров ."

basket = {}

THE_INITIAL_VALUE_OF_THE_COST_OF_ALL_PURCHASES = 0

sum_of_prices = THE_INITIAL_VALUE_OF_THE_COST_OF_ALL_PURCHASES

loop do 
  puts "Введите 'stop' , если все необходимые товары в корзине"
  puts "Введите название товара"
  product_name = gets.chomp
  break if product_name == "stop"
  puts "Введите цену товара за штуку"
  price = gets.chomp.to_f
  puts "Введите кол-во товаров"
  quantity = gets.chomp.to_f
  basket[product_name] = {price: price, quantity: quantity}
end

basket.each do |product_name,prices|
  puts "Общая стоимость товара #{product_name} в корзине : #{prices[:price] * prices[:quantity]} условных единиц."
  sum_of_prices += (prices[:price] * prices[:quantity])
end

puts "Общая стоимость всех товаров в корзине : #{sum_of_prices} условных единиц ."

puts basket.inspect

