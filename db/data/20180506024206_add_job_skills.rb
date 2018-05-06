class AddJobSkills < SeedMigration::Migration
  JOB_SKILLS = [['postgresql', 'Back-end', 'Desenvolvedor Back-end'], ['AWS', 'Back-end', 'Desenvolvedor Back-end'], ['Google Cloud Platform', 'Back-end', 'Desenvolvedor Back-end'], ['Docker', 'Back-end', 'Desenvolvedor Back-end'], ['ElasticSearch', 'Back-end', 'Desenvolvedor Back-end'], ['Inglês', 'Pessoal', 'Desenvolvedor Back-end'], ['SEO', 'Back-end', 'Desenvolvedor Back-end'], ['auto-gerenciamento', 'Pessoal', 'Desenvolvedor Back-end'], ['administração do tempo', 'Pessoal', 'Desenvolvedor Back-end'], ['autonomia', 'Pessoal', 'Desenvolvedor Back-end'], ['criatividade', 'Pessoal', 'Desenvolvedor Back-end'], ['decisão', 'Pessoal', 'Desenvolvedor Back-end'], ['flexibilidade', 'Pessoal', 'Desenvolvedor Back-end'], ['organização', 'Pessoal', 'Desenvolvedor Back-end'], ['Planejamento', 'Pessoal', 'Desenvolvedor Back-end'], ['problem solving', 'Pessoal', 'Desenvolvedor Back-end'], ['pró-atividade', 'Pessoal', 'Desenvolvedor Back-end'], ['raciocínio lógico', 'Pessoal', 'Desenvolvedor Back-end'], ['responsabilidade', 'Pessoal', 'Desenvolvedor Back-end'], ['Ruby', 'Back-end', 'Desenvolvedor Back-end'], ['Elixir', 'Back-end', 'Desenvolvedor Back-end'], ['linux', 'Back-end', 'Desenvolvedor Back-end'], ['CloudFront', 'Back-end', 'Desenvolvedor Back-end'], ['S3', 'Back-end', 'Desenvolvedor Back-end'], ['css', 'Front-end', 'Desenvolvedor Back-end'], ['html', 'Front-end', 'Desenvolvedor Back-end'], ['Javascript', 'Front-end', 'Desenvolvedor Back-end'], ['Phoenix', 'Back-end', 'Desenvolvedor Back-end'], ['Rails', 'Back-end', 'Desenvolvedor Back-end'], ['trabalho em equipe', 'Pessoal', 'Desenvolvedor Back-end'], ['Inglês', 'Pessoal', 'Desenvolvedor Front-end'], ['SEO', 'Front-end', 'Desenvolvedor Front-end'], ['auto-gerenciamento', 'Pessoal', 'Desenvolvedor Front-end'], ['autonomia', 'Pessoal', 'Desenvolvedor Front-end'], ['criatividade', 'Pessoal', 'Desenvolvedor Front-end'], ['decisão', 'Pessoal', 'Desenvolvedor Front-end'], ['flexibilidade', 'Pessoal', 'Desenvolvedor Front-end'], ['organização', 'Pessoal', 'Desenvolvedor Front-end'], ['Planejamento', 'Pessoal', 'Desenvolvedor Front-end'], ['problem solving', 'Pessoal', 'Desenvolvedor Front-end'], ['pró-atividade', 'Pessoal', 'Desenvolvedor Front-end'], ['raciocínio lógico', 'Pessoal', 'Desenvolvedor Front-end'], ['responsabilidade', 'Pessoal', 'Desenvolvedor Front-end'], ['css', 'Front-end', 'Desenvolvedor Front-end'], ['html', 'Front-end', 'Desenvolvedor Front-end'], ['Javascript', 'Front-end', 'Desenvolvedor Front-end'], ['CloudFront', 'Front-end', 'Desenvolvedor Front-end'], ['Ruby', 'Back-end', 'Desenvolvedor Front-end'], ['Elixir', 'Back-end', 'Desenvolvedor Front-end'], ['Phoenix', 'Back-end', 'Desenvolvedor Front-end'], ['Rails', 'Back-end', 'Desenvolvedor Front-end'], ['trabalho em equipe', 'Pessoal', 'Desenvolvedor Front-end'], ['SASS', 'Front-end', 'Desenvolvedor Front-end'], ['Bootstrap', 'Front-end', 'Desenvolvedor Front-end'], ['Material Design', 'Front-end', 'Desenvolvedor Front-end'], ['Usabilidade', 'Front-end', 'Desenvolvedor Front-end'], ['User Experience', 'Front-end', 'Desenvolvedor Front-end'], ['User Interface', 'Front-end', 'Desenvolvedor Front-end'], ['Modelagem de dados', 'Back-end', 'Desenvolvedor Front-end'], ['postgresql', 'Análise de Dados', 'BI Analyst'], ['machine learning', 'Análise de Dados', 'BI Analyst'], ['Inglês', 'Pessoal', 'BI Analyst'], ['Google Analytics', 'Análise de Dados', 'BI Analyst'], ['excel', 'Análise de Dados', 'BI Analyst'], ['administração do tempo', 'Pessoal', 'BI Analyst'], ['assertividade', 'Pessoal', 'BI Analyst'], ['auto-gerenciamento', 'Pessoal', 'BI Analyst'], ['comunicação escrita', 'Pessoal', 'BI Analyst'], ['confrontação', 'Pessoal', 'BI Analyst'], ['criatividade', 'Pessoal', 'BI Analyst'], ['decisão', 'Pessoal', 'BI Analyst'], ['organização', 'Pessoal', 'BI Analyst'], ['persistência', 'Pessoal', 'BI Analyst'], ['Planejamento', 'Pessoal', 'BI Analyst'], ['problem solving', 'Pessoal', 'BI Analyst'], ['raciocínio lógico', 'Pessoal', 'BI Analyst'], ['trabalho em equipe', 'Pessoal', 'BI Analyst'], ['Python', 'Análise de Dados', 'BI Analyst'], ['R', 'Análise de Dados', 'BI Analyst'], ['MATLAB', 'Análise de Dados', 'BI Analyst'], ['contorno de objeção', 'Comercial', 'Guia do Aluno - Telefone'], ['senso de urgência', 'Comercial', 'Guia do Aluno - Telefone'], ['telemarketing', 'Comercial', 'Guia do Aluno - Telefone'], ['administração do tempo', 'Pessoal', 'Guia do Aluno - Telefone'], ['ambição', 'Pessoal', 'Guia do Aluno - Telefone'], ['carisma', 'Pessoal', 'Guia do Aluno - Telefone'], ['comunicação verbal', 'Pessoal', 'Guia do Aluno - Telefone'], ['controle emocional', 'Pessoal', 'Guia do Aluno - Telefone'], ['empatia', 'Pessoal', 'Guia do Aluno - Telefone'], ['Negociação', 'Comercial', 'Guia do Aluno - Telefone'], ['persuasão', 'Pessoal', 'Guia do Aluno - Telefone'], ['ritmo', 'Pessoal', 'Guia do Aluno - Telefone'], ['OPA', 'Comercial', 'Guia do Aluno - Telefone'], ['Português', 'Pessoal', 'Guia do Aluno - Telefone'], ['contorno de objeção', 'Comercial', 'Guia do Aluno - Chat'], ['senso de urgência', 'Comercial', 'Guia do Aluno - Chat'], ['telemarketing', 'Comercial', 'Guia do Aluno - Chat'], ['administração do tempo', 'Pessoal', 'Guia do Aluno - Chat'], ['ambição', 'Pessoal', 'Guia do Aluno - Chat'], ['carisma', 'Pessoal', 'Guia do Aluno - Chat'], ['comunicação escrita', 'Pessoal', 'Guia do Aluno - Chat'], ['controle emocional', 'Pessoal', 'Guia do Aluno - Chat'], ['empatia', 'Pessoal', 'Guia do Aluno - Chat'], ['Negociação', 'Comercial', 'Guia do Aluno - Chat'], ['persuasão', 'Pessoal', 'Guia do Aluno - Chat'], ['ritmo', 'Pessoal', 'Guia do Aluno - Chat'], ['OPA', 'Comercial', 'Guia do Aluno - Chat'], ['Português', 'Pessoal', 'Guia do Aluno - Chat'], ['contorno de objeção', 'Comercial', 'Líder de Vendas'], ['senso de urgência', 'Comercial', 'Líder de Vendas'], ['telemarketing', 'Comercial', 'Líder de Vendas'], ['administração do tempo', 'Pessoal', 'Líder de Vendas'], ['ambição', 'Pessoal', 'Líder de Vendas'], ['carisma', 'Pessoal', 'Líder de Vendas'], ['comunicação escrita', 'Pessoal', 'Líder de Vendas'], ['comunicação verbal', 'Pessoal', 'Líder de Vendas'], ['controle emocional', 'Pessoal', 'Líder de Vendas'], ['empatia', 'Pessoal', 'Líder de Vendas'], ['Negociação', 'Comercial', 'Líder de Vendas'], ['persuasão', 'Pessoal', 'Líder de Vendas'], ['ritmo', 'Pessoal', 'Líder de Vendas'], ['OPA', 'Comercial', 'Líder de Vendas'], ['Português', 'Pessoal', 'Líder de Vendas'], ['abertura', 'Pessoal', 'Líder de Vendas'], ['autonomia', 'Pessoal', 'Líder de Vendas'], ['controle', 'Liderança', 'Líder de Vendas'], ['delegação', 'Liderança', 'Líder de Vendas'], ['decisão', 'Liderança', 'Líder de Vendas'], ['estratégico', 'Liderança', 'Líder de Vendas'], ['organização', 'Liderança', 'Líder de Vendas'], ['Planejamento', 'Liderança', 'Líder de Vendas'], ['responsabilidade', 'Pessoal', 'Líder de Vendas'], ['trabalho em equipe', 'Pessoal', 'Líder de Vendas'], ['postgresql', 'Análise de Dados', 'Operações'], ['senso de urgência', 'Pessoal', 'Operações'], ['Inglês', 'Pessoal', 'Operações'], ['Português', 'Pessoal', 'Operações'], ['excel', 'Análise de Dados', 'Operações'], ['administração do tempo', 'Pessoal', 'Operações'], ['assertividade', 'Pessoal', 'Operações'], ['autonomia', 'Pessoal', 'Operações'], ['auto-gerenciamento', 'Pessoal', 'Operações'], ['comunicação escrita', 'Pessoal', 'Operações'], ['comunicação verbal', 'Pessoal', 'Operações'], ['organização', 'Pessoal', 'Operações'], ['Planejamento', 'Pessoal', 'Operações'], ['responsabilidade', 'Pessoal', 'Operações'], ['Ruby', 'Back-end', 'Operações'], ['Rails', 'Back-end', 'Operações'], ['controle', 'Liderança', 'Tech Lead'], ['delegação', 'Liderança', 'Tech Lead'], ['decisão', 'Liderança', 'Tech Lead'], ['estratégico', 'Liderança', 'Tech Lead'], ['organização', 'Liderança', 'Tech Lead'], ['Planejamento', 'Liderança', 'Tech Lead'], ['postgresql', 'Back-end', 'Tech Lead'], ['AWS', 'Back-end', 'Tech Lead'], ['Google Cloud Platform', 'Back-end', 'Tech Lead'], ['Docker', 'Back-end', 'Tech Lead'], ['ElasticSearch', 'Back-end', 'Tech Lead'], ['Inglês', 'Pessoal', 'Tech Lead'], ['SEO', 'Back-end', 'Tech Lead'], ['auto-gerenciamento', 'Pessoal', 'Tech Lead'], ['administração do tempo', 'Pessoal', 'Tech Lead'], ['autonomia', 'Pessoal', 'Tech Lead'], ['criatividade', 'Pessoal', 'Tech Lead'], ['decisão', 'Pessoal', 'Tech Lead'], ['flexibilidade', 'Pessoal', 'Tech Lead'], ['organização', 'Pessoal', 'Tech Lead'], ['Planejamento', 'Pessoal', 'Tech Lead'], ['problem solving', 'Pessoal', 'Tech Lead'], ['pró-atividade', 'Pessoal', 'Tech Lead'], ['raciocínio lógico', 'Pessoal', 'Tech Lead'], ['responsabilidade', 'Pessoal', 'Tech Lead'], ['Ruby', 'Back-end', 'Tech Lead'], ['Elixir', 'Back-end', 'Tech Lead'], ['linux', 'Back-end', 'Tech Lead'], ['CloudFront', 'Back-end', 'Tech Lead'], ['S3', 'Back-end', 'Tech Lead'], ['css', 'Front-end', 'Tech Lead'], ['html', 'Front-end', 'Tech Lead'], ['Javascript', 'Front-end', 'Tech Lead'], ['Phoenix', 'Back-end', 'Tech Lead'], ['Rails', 'Back-end', 'Tech Lead'], ['trabalho em equipe', 'Pessoal', 'Tech Lead'], ['postgresql', 'Análise de Dados', 'Product Owner'], ['machine learning', 'Análise de Dados', 'Product Owner'], ['Inglês', 'Pessoal', 'Product Owner'], ['Google Analytics', 'Análise de Dados', 'Product Owner'], ['excel', 'Análise de Dados', 'Product Owner'], ['administração do tempo', 'Pessoal', 'Product Owner'], ['assertividade', 'Pessoal', 'Product Owner'], ['auto-gerenciamento', 'Pessoal', 'Product Owner'], ['comunicação escrita', 'Pessoal', 'Product Owner'], ['comunicação verbal', 'Pessoal', 'Product Owner'], ['confrontação', 'Pessoal', 'Product Owner'], ['criatividade', 'Pessoal', 'Product Owner'], ['decisão', 'Pessoal', 'Product Owner'], ['organização', 'Pessoal', 'Product Owner'], ['persistência', 'Pessoal', 'Product Owner'], ['Planejamento', 'Pessoal', 'Product Owner'], ['problem solving', 'Pessoal', 'Product Owner'], ['raciocínio lógico', 'Pessoal', 'Product Owner'], ['trabalho em equipe', 'Pessoal', 'Product Owner'], ['controle', 'Liderança', 'Product Owner'], ['delegação', 'Liderança', 'Product Owner'], ['decisão', 'Liderança', 'Product Owner'], ['estratégico', 'Liderança', 'Product Owner'], ['organização', 'Liderança', 'Product Owner'], ['Planejamento', 'Liderança', 'Product Owner'], ['User Experience', 'Front-end', 'Product Owner'], ['User Interface', 'Front-end', 'Product Owner'], ['Usabilidade', 'Front-end', 'Product Owner'], ['Ruby', 'Back-end', 'Product Owner'], ['Elixir', 'Back-end', 'Product Owner'], ['Rails', 'Back-end', 'Product Owner'], ['Phoenix', 'Back-end', 'Product Owner']]

  def up
    JOB_SKILLS.each do |s, c, j|
      job = Job.find_by(name: j)
      skill = Skill.find_by(description: s)
      competence = Competence.find_by(name: c)

      JobSkill.create(job: job, skill: skill, competence: competence)
    end
  end

  def down
    JobSkill.destroy_all
  end
end
