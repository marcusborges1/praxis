# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
%w(Consultor Assessor Diretor Presidente Gerente Coordenador).each do |position_name|
  Position.create(name: position_name, context: :institutional)
end

%w(DAF DIPRO MKT GP PRESI NEG Trainee).each do |sector_name|
  Sector.create(name: sector_name)
end

User.create(name: "teste", email: "teste@praxisconsultoria.org.br", password: "teste123",
  sector: Sector.first, positions: [Position.find(3)])
