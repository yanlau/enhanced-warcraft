class Unit

  attr_reader :attack_power, :health_points
  attr_accessor :damage

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
    @damage = 0
  end

  def attack!(enemy)
    if dead?
      return "You cannot attack, you are dead!"
    else
      enemy.damage(@attack_power)
    end
  end

  def damage(ap)
    @health_points -= ap
  end

  def dead?
    @health_points <= 0
  end

end