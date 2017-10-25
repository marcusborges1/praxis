require 'csv'

%w(Assessor Diretor Presidente Gerente Trainee).each do |position_name|
  Position.create(name: position_name, context: :institutional)
end

%w(DAF DIPRO GP MKT NEG PRESINST PRESORG).each do |sector_name|
  sector = Sector.create(name: sector_name)
  EvaluationModel.create(name: "Modelo Avaliação #{sector_name}",
                         sector: sector)
end

CSV.foreach("db/dados-membros.csv") do |user|
  User.create(name: user[0],
              sector: Sector.find_by(name: user[1]),
              positions: [Position.find_by(name: user[2])],
              email: user[3],
              password: user[4])
end

CSV.foreach("db/avaliacao.csv") do |question|
  evaluation_factor = EvaluationFactor.create(name: question[0])
  Question.create(evaluation_factor: evaluation_factor,
                  description: question[1],
                  options: [Option.create(description: "Muito Característico", weight: 10),
                            Option.create(description: "", weight: 9),
                            Option.create(description: "", weight: 8),
                            Option.create(description: "", weight: 7),
                            Option.create(description: "", weight: 6),
                            Option.create(description: "", weight: 5),
                            Option.create(description: "", weight: 4),
                            Option.create(description: "", weight: 3),
                            Option.create(description: "", weight: 2),
                            Option.create(description: "Nada Característico", weight: 1)])
end

def questions_array
  questions = Array.new
  Question.all.each do |question| questions << question end
  questions.reverse
end

CSV.foreach("db/pesos-questoes.csv") do |question_values|
  evaluation_model = EvaluationModel.find_by(sector: Sector.find_by(name: question_values[0]))
  questions_array.each_with_index do |question,index|
    QuestionValue.create(value: question_values[index+1],
                         question: question,
                         evaluation_model: evaluation_model)
  end
end
