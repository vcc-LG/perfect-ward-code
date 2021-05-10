questions = Question.create([{ text: 'Can you code in Ruby?' }, { text: 'Can you code in JavaScript?' },
                             { text: 'Can you code in Swift (iOS)?' }, { text: 'Can you code in Java (Android)?' },
                             { text: 'Can you code in C#?' }])

questionnaire = Questionnaire.create(questions: questions, title: 'Candidate Interview')

candidate = Candidate.create(name: 'Leo')

questionnaire.sections.each do |s|
  Response.create(section: s, value: [true, false].sample, candidate: candidate)
end

Questionnaire.all.each do |q|
  Candidate.all.each do |c|
    if q.candidate_response?(c)
      puts "Candidate #{c.name} scored #{q.score(c)} % for #{q.title}"
    else
      puts "Candidate #{c.name} did not respond to #{q.title}"
    end
  end
end
