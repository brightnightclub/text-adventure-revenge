class Room
  attr_accessor :name
  attr_accessor :description

  def initialize(name: 'A Room', description: 'It is about like you would expect')
    self.name = name
    self.description = description
  end

  def portals
    @portals ||= []
  end

end
