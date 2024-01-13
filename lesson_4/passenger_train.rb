class PassengerTrain < Train

	def attach_a_wagon (wagon)
		return if wagon.class != PassengerCarriage
		super (wagon)
	end
end