class Building

  attr_reader :health_points

  def initialize(hp)
    @health_points = hp
    @damage = 0
  end

  def damage(ap)
    @health_points -= ap
  end

end