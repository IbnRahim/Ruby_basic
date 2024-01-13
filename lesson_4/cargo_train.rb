class CargoTrain < Train


	def attach_a_wagon (wagon)
		return if wagon.class != CargoCarriage
		super (wagon)
	end
end