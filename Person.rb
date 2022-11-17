class Person
    attr_accessor :name, :age
    attr_reader :id

    def initialize(age, name: "Unknown", parent_permission: true)
        @id = Random.rand(1..1000)
        @age = age
        @name = name
        @parent_permission = parent_permission
    end

    def can_use_services?
        is_of_age? || @parent_permission
    end

    private

    def of_age?
        @age >= 18
    end
end
