class Questions

  def initialize()
      @num1 = rand(0..20) # randomly pick a number between 0 and 20
      @num2 = rand(0..20) 
      @answer = num1 + num2
  end

  def correct?(input)
    input == @answer # if input equals answer (correct? is true)
  end
end

