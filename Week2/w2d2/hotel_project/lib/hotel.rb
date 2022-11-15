require_relative "room"

class Hotel
    attr_reader :rooms
    attr_writer :name
  def initialize(name, hash)
    @name = name
    @rooms = {}

    hash.each do |k, v|
        @rooms[k] = Room.new(v)
    end
  end
    
  def name
    words = @name.split(" ")
    new_name = words.map do |words|
        words.capitalize
    end
       new_name.join(" ")
    end

    def room_exists? (str)
        @rooms.has_key?(str)
    end

    def check_in (person, string)
        if room_exists?(string)
            if @rooms[string].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each do |key, v|
            if !@rooms[key].full?
                return true
            end
        end
        return false
    end

    def list_rooms
        @rooms.each do |key, v|
            puts "#{key} has #{v.available_space}"
        end
    end
end
