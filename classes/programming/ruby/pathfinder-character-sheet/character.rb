require "yaml"

class Character
  attr_accessor :name
  attr_accessor :level
  attr_accessor :file_name
  attr_accessor :str_score, :dex_score, :con_score, :int_score, :wis_score, :cha_score

  def initialize
    @class_formulas = {
      :base_atk_type => :full,
      :hit_die => :d10,
      :skill_points => 2,
      :fortitude_save => :weak,
      :reflex_save => :strong,
      :will_save => :weak,
    }
  end
  def score_to_mod(score)
    if (score % 2 == 0)
      return (score - 10) / 2
    else
      return (score - 11) / 2
    end
  end

  def str
    score_to_mod(@str_score)
  end
  def dex
    score_to_mod(@dex_score)
  end
  def con
    score_to_mod(@con_score)
  end
  def int
    score_to_mod(@int_score)
  end
  def wis
    score_to_mod(@wis_score)
  end
  def cha
    score_to_mod(@cha_score)
  end

  def describe
    puts "Your character's name is #{@name}!"
    puts "Your character's level is #{@level}!"
    puts "Your Strength score is a mighty #{@str_score}, giving you a mod of #{str}!"
    puts "Your Dexterity score is a skillful #{@dex_score}, giving you a mod of #{dex}!"
    puts "Your Constitution score is a hearty #{@con_score}, giving you a mod of #{con}!"
    puts "Your Intelligence score is a towering #{@int_score}, giving you a mod of #{int}!"
    puts "Your Wisdom score is an intuitive #{@wis_score}, giving you a mod of #{wis}!"
    puts "Your Charisma score is a sexy #{@cha_score}, giving you a mod of #{cha}!"
  end

  def roll_die(size)
    rand(size) + 1
  end
  def roll_d20
    roll_die(20)
  end

  def save
    if @file_name.class == String
      f = File.new(@file_name, "w")
      YAML.dump(self,f)
      f.close
    else
      puts "Please assign a value to @file_name and try again."
    end
  end
  def base_atk_bonus
    if @class_formulas[:base_atk_type] == :full
      return (@level * 1)
    elsif @class_formulas[:base_atk_type] == :half
      return (@level * 0.5).to_i
    elsif @class_formulas[:base_atk_type] == :three_quarter
      return (@level * 0.75).to_i
    else
      puts "I don't understand the base atk type #{@class_formulas[:base_atk_type]}."
    end
  end
  def save_bonus(type)
    if @class_formulas[type] == :weak
      return @level / 3
    elsif @class_formulas[type] == :strong
      return @level / 2 + 2
    else
      puts "I don't understand the saving throw type #{type}."
    end
  end
  def roll_fort_save
    roll = roll_d20
    fortitude = save_bonus(:fortitude_save)
    puts "You rolled a total of #{roll + fortitude + con}!! (d20: #{roll}, Base Save: #{fortitude}, Con: #{con})"
  end
  def roll_ref_save
    roll = roll_d20
    reflex = save_bonus(:reflex_save)
    puts "You rolled a total of #{roll + reflex + dex}!! (d20: #{roll}, Base Save: #{reflex}, Dex: #{dex})"
  end
  def roll_will_save
    roll = roll_d20
    will = save_bonus(:will_save)
    puts "You rolled a total of #{roll + will + wis}!! (d20: #{roll}, Base Save: #{will}, Wis: #{wis})"
  end
  def roll_melee_atk
    roll = roll_d20
    puts "You rolled a total of #{roll + base_atk_bonus + str}!! (d20: #{roll}, BaB: #{base_atk_bonus}, Str: #{str})"
  end
end

require "./classes.rb"

p1 = YAML.load_file("rhes.yaml")
#p1 = Bard.new
#p1.level = 5

p1.roll_fort_save

#p1 = Character.new
#print "Enter your character's name! "
#p1.name = gets.chomp
#p1.describe
#p1.file_name = "rhes"
#p1.save
