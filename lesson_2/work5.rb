#Дни месяцев
#Задать Хэш , в котором будут содержаться месяцы и кол-во дней в каждом месяце.
#Создать цикл который будет выводить те месяци , из хэша, кол-во дней которых равно 30 .

months = {
  'january' => 31,
  'february' => 28, 
  'march' => 31, 
  'april' => 30, 
  'may' => 31, 
  'june' => 30, 
  'july' => 31, 
  'august' => 31, 
  'september' => 30, 
  'october' => 31, 
  'november' => 30, 
  'december' => 31
}

months.each {|key,value| puts key if value == 30}
