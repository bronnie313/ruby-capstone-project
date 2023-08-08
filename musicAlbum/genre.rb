class Genre
    attr_reader: name

    private 
    attr_reader :id, :items

    def initialize(id, name )
        @id = id
        @name = name 
        @items = []
    end

    def add_item(item)
        @items << item
    end
end