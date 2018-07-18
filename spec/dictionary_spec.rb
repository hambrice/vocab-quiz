# words = {"nuclear" => "deriving destructive energy from releasing atomic energy",
#           "sweltering" => "excessively hot and humid; marked by sweating and faintness",
#         "tropical" => "hot and humid"}
# title = {"The Sweltering Words of Summer"}
describe 'Dictionary' do
  let (:words) do
    {
      "nuclear" => "deriving destructive energy from releasing atomic energy",
      "sweltering" => "excessively hot and humid; marked by sweating and faintness",
      "tropical" => "hot and humid"
    }
  end

  let (:title) do
    "The Sweltering Words of Summer"
  end

  let(:dictionary) {VocabQuiz::Dictionary.new(words, title)}

  describe "#initialize with #words" do
    it "accepts a hash of words" do
      expect(dictionary.words).to eq({"nuclear" => "deriving destructive energy from releasing atomic energy",
                "sweltering" => "excessively hot and humid; marked by sweating and faintness",
              "tropical" => "hot and humid"})
    end
  end

  describe "#initialize with #title" do
    it "accepts a string as a title" do
      expect(dictionary.title).to eq("The Sweltering Words of Summer")
    end
  end

  describe "#count" do
    it "returns the amount of words in the dictionary" do
      expect(dictionary.count).to eq(3)
    end
  end

end
