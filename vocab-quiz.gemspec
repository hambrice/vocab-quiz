
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vocab-quiz/version"

Gem::Specification.new do |spec|
  spec.name          = "vocab-quiz"
  spec.version       = VocabQuiz::VERSION
  spec.authors       = ["'Brad Hambrice'"]
  spec.email         = ["'hambrice@uab.edu'"]

  spec.summary       = "Creates a vocabulary quiz"
  spec.description   = "This application provides a CLI that builds a vocabulary quiz from a given list on vocabulary.com. Users can pick from several provided lists within the program or can supply their own list from the vocabulary.com website."
  spec.homepage      = "https://github.com/hambrice/vocab-quiz"
  spec.license       = "MIT"
  spec.files         = ["lib/vocab-quiz.rb", "lib/vocab-quiz/CLI.rb", "lib/vocab-quiz/scraper.rb", "lib/vocab-quiz/dictionary.rb", "lib/vocab-quiz/question.rb", "lib/vocab-quiz/game.rb", "config/environment.rb"]
  spec.executables << "run"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 0"
  spec.add_development_dependency "pry", "~> 0"

  spec.add_dependency "nokogiri", "~> 1.8"
end