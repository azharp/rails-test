#- [LVL1-QUIZ]
class Question < ApplicationRecord

  has_one :user_answer

  #Validations:
  #- content and answer must be present
  validates :content, presence: true
  validates :answer, presence: true

  #--
  def check_answer(answer)
    # given an answer
    # please validate that
    #  - the response is correct
    #  - the response must be case and whitespace insensitive
    #  - the response must be number to word insensitive

    answer = answer.downcase.strip
    answer = word_to_num(answer)
    correct_answer = self.answer.downcase.strip
    correct_answer = word_to_num(correct_answer)

    answer == correct_answer
  end

  private

  def word_to_num(word)
    case word
    when 'one'
      '1'
    when 'two'
      '2'
    when 'three'
      '3'
    when 'four'
      '4'
    when 'five'
      '5'
    when 'six'
      '6'
    when 'seven'
      '7'
    when 'eight'
      '8'
    when 'nine'
      '9'
    when 'ten'
      '10'
    else
      word
    end
  end
end
