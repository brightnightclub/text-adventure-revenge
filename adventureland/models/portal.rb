class Portal
  attr_accessor :destination, :name, :description
  
  def initialize(destination:, name: 'A wooden door', description: 'It looks somewhat old')
    self.destination = destination
    self.name = name
    self.description = description
  end

end
