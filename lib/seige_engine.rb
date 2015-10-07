# http://classic.battle.net/war3/human/units/footman.shtml

class SeigeEngine < Unit

  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    super(400, 50)
  end

  def attack!(enemy)
    if dead?
      puts "You cannot attack, you are dead!"
    else
      case
      when enemy.is_a?(Building)
        enemy.damage(@attack_power * 2)
      when enemy.is_a?(Unit)
        return "Seige engines cannot attack other units"
      else
        enemy.damage(@attack_power)
      end
    end
  end


end
