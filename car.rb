class Car
	@@count = 0
	attr_accessor :name, :make, :year, :color

	def initialize(name, make, year, color)
		@name = name
		@make = make
		@year = year
		@color = color
		@@count += 1
	end

	def self.get_count
		return @@count
	end

	def print
		p "name: #{@name}"
		p "make: #{@make}"
		p "year: #{@year}"
		p "color: #{@color}"
	end
end

def buy_car (garage)
	puts 'What is the name of your car? '
	name = gets.chomp
	puts 'What is its make? '
	make = gets.chomp
	puts 'Year of release? '
	year = gets.chomp.to_i
	puts 'Color of car? '
	color = gets.chomp
	car = Car.new(name, make, year, color)
	garage.push(car)
end

def sort_cars_by_year (garage)
	garage.sort{|a, b| a.year <=> b.year}
end

garage = []

quit = false

while (!quit)
	puts "(1) Buy a car"
	puts "(2) Sort cars by year"
	puts "(3) Drive car"
	puts "(4) Sell a car"
	puts "(5) View all cars"
	puts "(6) Quit"

	option = gets.chomp.to_i rescue 4
	
	if (option == 1)
		garage = buy_car(garage)
	elsif (option == 2)
		garage = sort_cars_by_year(garage)
	elsif (option == 3)
		puts "which car would you like to drive? (between 0 and #{garage.length - 1})"
		selected = gets.chomp.to_i
		garage[selected].print rescue puts "You don't own that car :/"
	elsif (option == 4)
		puts "which car would you like to sell? (between 0 and #{garage.length - 1})"
		selected = gets.chomp.to_i
		garage.delete_at(selected) rescue puts "You don't own that car :/"
	elsif (option == 5)
		for index in 0...garage.size
			garage[index].print rescue puts "You don't own that car :/"
		end
	end
elsif (option == 6)
		quit = true
		puts "Have a nice day!"
	end
end