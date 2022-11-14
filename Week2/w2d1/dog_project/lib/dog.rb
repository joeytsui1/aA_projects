class Dog
    def initialize (name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name # GETTER
        @name
    end

    def breed # GETTER
        @breed
    end

    def age # GETTER
        @age
    end

    def bark # GETTER
        @age > 3 ? @bark.upcase : @bark.downcase
    end

    def favorite_foods # GETTER
        @favorite_foods
    end

    def favorite_food? (str) # GETTER
        @favorite_foods.include?(str.capitalize)
    end
    def age= (new_age) #SETTER
        @age = new_age
    end

end
