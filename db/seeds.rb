questions = Question.create([{ text: 'Can you code in Ruby?' }, { text: 'Can you code in JavaScript?' },
                             { text: 'Can you code in Swift (iOS)?' }, { text: 'Can you code in Java (Android)?' },
                             { text: 'Can you code in C#?' }])

hard_questions = Question.create([{ text: 'Can you code in Fortran?' }, { text: 'Can you code in COBOL?' },
                                  { text: 'Can you code in Perl?' }, { text: 'Can you code in CoffeeScript?' },
                                  { text: 'Can you code in Visual Basic?' }])

questionnaire_one = Questionnaire.create(questions: questions, title: 'Job Interview Questions')
questionnaire_two = Questionnaire.create(questions: hard_questions, title: 'Really Hard Job Interview Questions')

candidate_one = Candidate.create(name: 'Leo')
candidate_two = Candidate.create(name: 'Hannah')

questionnaire_one.sections.each do |s|
  Response.create(section: s, value: [true, false].sample, candidate: candidate_one)
end

questionnaire_two.sections.each do |s|
  Response.create(section: s, value: [true, false].sample, candidate: candidate_two)
end
