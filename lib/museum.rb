class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @winner = nil
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
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

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |memo, exhibit|
      memo[exhibit] = []
      @patrons.each do |patron|
        if patron.interests.include? exhibit.name
          memo[exhibit] << patron
        end
      end
      memo
    end
  end

  def ticket_lottery_contestants(exhibit)
    interests = patrons_by_exhibit_interest
    results = []
    interests.each do |exhibit, patrons|
      patrons.each do |patron|
        if patron.spending_money < exhibit.cost
          results << patron
        end
      end
    end
    results
  end

  def draw_lottery_winner(exhibit)
    contestents = ticket_lottery_contestants(exhibit)
    @winner = contestents.sample
  end

  def announce_lottery_winner(exhibit)
    "#{@winner.name} has won the #{exhibit.name} lottery"
  end
end
