class Level < ActiveHash::Base

self.data=[
  {id:1, level: 'easy'},{id:2, level: 'normal'},{id:3, level:'hard'},{id:4, level:'trial'}
]

 include ActiveHash::Associations
 has_many :questions
 has_many :results

end