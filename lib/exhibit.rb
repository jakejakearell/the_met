class Exhibit

  def initialize(data)
    @data = data
  end

  def cost
    @data[:cost]
  end

  def name
    @data[:name]
  end
  
end
