class Room
  attr_accessor :name
  attr_accessor :description
  attr_accessor :portals

  def initialize(name: 'A Room', description: 'It is about like you would expect')
    self.name = name
    self.description = description
    self.portals = []
  end

end
