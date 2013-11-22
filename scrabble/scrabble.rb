require_relative 'answer'
require 'set'

class Scrabble
  attr_accessor :answer, :answer_count

  def initialize(input)
    @input = input
    @answer = []
    @answer_count = 0
    calculate_words
  end

  def calculate_words
    word_bank = set_word_bank('scrabble/words.txt')
    input_array = @input.split(//)
    count = 1

    while @input.length >= count
      input_array.permutation(count).to_a.uniq.each do |word_array|
        word = word_array.join(",").gsub(",", "")
        if word_bank.include?(word)
          answer = Answer.new(word)
          @answer << [answer.word, answer.score]
        end
      end
      count += 1
    end
    @answer.sort! {|a, b| b[1] <=> a[1]}
    @answer_count = @answer.count
    @answer = @answer[0..9]
  end

  private
  def set_word_bank(path)
    File.readlines(path).map {|line| line.strip.downcase}.to_set
  end
end