require "csv"

#trial_answers
1.upto(10) do |n|
Question.create!(
  questions: open("./app/assets/images/trial/trial_#{n}.png","r"), point: '0', level_id: '4'
  )
end

#trial_contents
CSV.foreach('db/trial_choises.csv', headers: true) do |row|
  Choise.create(
    content: row['content'],
    is_answer: row['is_answer'],
    question_id: row['question_id'],
  )
end