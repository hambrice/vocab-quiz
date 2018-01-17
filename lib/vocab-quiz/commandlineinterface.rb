require_relative "../lib/game.rb"

class CLI 
  
  def input_valid?(input)
    input.include?("vocabulary.com/lists/") || input.to_i > 0 && input.to_i < 5
  end
  
  def choose_dictionary
    puts "1. Most Difficult SAT Words(300 words)\n\n"
    sleep(0.5)
    puts "2. Armed Services Vocational Aptitude Battery (ASVAB) Word Knowledge (100 words)\n\n"
    sleep(0.5)
    puts "3. GRE High Frequency Words (334 words)\n\n"
    sleep(0.5)
    puts "4. Lights\n\n"
    sleep(0.5)
    puts "Select a list by entering its corresponding number.\n\n"
    sleep(0.25)
    puts "Don't like any of these options?" 
    puts "You can also provide your own list by entering the URL of the list from vocabulary.com."
    input = gets.strip
    while !self.input_valid?(input)
      puts "Sorry, I didn't recognize that.\n\n"
      sleep(0.25)
      puts "Please select a provided list with its corresponding number."
      sleep(0.25)
      puts "Or find your own list on vocabulary.com and enter the URL."
      input = gets.strip
    end
    dictionary = Scraper.new.build_dictionary(input)
    puts "You've chosen '#{dictionary.title}'(#{dictionary.count} words). Is that correct?(yes/no)"
    input = gets.strip
    unless input.downcase == "yes" || input.downcase == "y"
      puts "Okay, let's try again.\n\n"
      self.choose_dictionary
    end
    dictionary
  end
  
  def question_count(dictionary)
    puts "Now, of the #{dictionary.count} words, how many would you like to try?"
    amount = gets.strip.to_i
    while amount < 1 || amount > dictionary.count
      "Sorry, please choose a number between 1 and #{dictionary.count}."
      amount = gets.strip.to_i
    end
    amount
  end
    
    
  def run
    puts "Welcome to your Vocabulary Quiz! This quiz is built on lists created by vocabulary.com.\n\n"
    sleep(1)
    puts "To get started, please choose a vocabulary category to begin!\n\n"
    sleep(1)
    dictionary = self.choose_dictionary
    sleep(0.25)
    amount = self.question_count(dictionary)
    sleep(0.25)
    puts "Great! You will be given a word and must select its definition from the given options.\n\n"
    puts "You can select your answer by using numbers or letters (a=1, b=2, etc).\n\n"
    sleep(1)
    puts "You can type exit at any time to quit once the game has begun. Press any key to begin!\n\n"
    gets
    Game.new(dictionary,amount).play
  end 
end

