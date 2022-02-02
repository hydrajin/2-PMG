class Players

  attr_reader :name, lives

  # when game starts display name and lives
  def initialize(name)
    @name = name
    @lives = 3
  end

  # lose 1 life for every wrong answer
  def wrong
    @lives -= 1
  end

  # check if a player is at 0 lives (if true then gameover)
  def is_alive?
    @lives > 0
  end
end