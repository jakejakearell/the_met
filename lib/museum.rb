class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.reduce([]) do |memo, exhibit|
      patron.interests.each do |hobby|
        if hobby == exhibit.name
          memo << exhibit
        end
      end
      memo
    end
  end
end
