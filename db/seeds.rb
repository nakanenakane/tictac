Question.create!(
 [
  {
   questions: File.open('./app/assets/images/trial/trial_1.png'),
   point: '0',
   level_id: '4' }
 ]
)


[
  ['さんじ','correct','1'],
  ['にじ','incorrect','1'],
  ['じゅうじ','incorrect','1']
].each do |content,is_answer,question_id|
  Choise.create!(
    { content:content, is_answer:is_answer, question_id:question_id}
  )
end