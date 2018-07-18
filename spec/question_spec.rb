describe "Question" do
  let (:words) do
    {
      "nuclear" => "deriving destructive energy from releasing atomic energy",
      "sweltering" => "excessively hot and humid; marked by sweating and faintness",
      "tropical" => "hot and humid",
      "test" => "whatever",
      "help" => "notsure"
    }
  end
  let (:question) do
    question = VocabQuiz::Question.new
    question.select_options(words)
    question
  end


  describe "#create options" do
    it "returns a list of 3 incorrect answers" do
      expect(question.options.count).to eq(3)
    end
  end
end
