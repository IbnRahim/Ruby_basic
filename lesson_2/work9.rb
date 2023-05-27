#Определение дня в году
#В начале приветствие к вводу .
#Необходимо принять три параметра , а именно день , месяц , год . Сделать это можно с помощью метода повторения раз (times).
#Полученные параметры принимаются в массив .
#Создаем хэш в котором ключи -- номера месяцев , а значения -- кол-во дней в оных.
#С помощью соответствующего метода берем массив значений вышеуказанного хэша , это будет массив "сумма дней в году"
#Складываем дни всех месяцев до указанного пользователем , присваиваем значение переменной.

#То как было.
#Создается хэш в котором будут ключи в виде номеров месяцев , а значения в виде того порядка в году который занимает первый день этого месяца.

#Вычисляется порядковый номер даты в году , пользуясь параметрами из массива (день и месяц) и суммами дней предыдущих месяцев .
#Далее идёт условное ветвление , и условие будет состоять в том что год должен быть высокосным , либо месяц должен быть один из первых трех .
#При выполнение условия выводим порядковый номер даты.
#Если условие не выполняется , тогда выводим порядковый номер даты с поправкой.

puts "Введите последовательно число дня, число месяца и год нужной вам даты , чтобы программа вычислила её порядковый номер в году"

date = []

3.times {date << gets.chomp.to_i}

#number_of_days_until_this_month = {1 => 0, 2 => 31, 3 => 60, 4 => 91, 5 => 121, 6 => 152, 7 => 182, 8 => 213, 9 => 244, 10 => 274, 11 => 305, 12 => 335 }
#Это то как было

months = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}

sum_of_days_of_the_year = months.values

number_of_days_until_this_month = sum_of_days_of_the_year[0...date[1]].sum

#То как было
#index_number1 = number_of_days_until_this_month[date[1]] + date[0]

index_number1 = number_of_days_until_this_month + date[0]

if (date[2] % 400 == 0 || (date[2] % 4 == 0 && date[2] % 100 != 0)) || (date[1] == 1 || date[1] == 2 || date[1] == 3)
  puts "Ваша дата имеет следующий порядковый номер в году : #{index_number1} день ."
else
  puts "Ваша дата имеет следующий порядковый номер в году : #{index_number1 - 1} день ."
end

  
