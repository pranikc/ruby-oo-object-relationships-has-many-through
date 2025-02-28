class Waiter
    attr_accessor :name, :years
    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal (customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        tip_arr = self.meals.map{|meal| meal.tip} 
        max_tip = tip_arr.max 
        best_meal = self.meals.find{|meal| meal.tip == max_tip}
        best_meal.customer
    end
end
