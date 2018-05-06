class InsertBasicInfo < SeedMigration::Migration
  FAMILIES = ['analytics', 'bancos de dados nosql', 'bancos de dados sql', 'cloud infrastructure', 'comercial', 'conteinerização', 'design software', 'elastic stack', 'ferramentas de provisionamento', 'idioma', 'image editor', 'marketing', 'ms office', 'pessoal', 'programming language', 'sistema operacional', 'soluções aws', 'video', 'video editor', 'virtualização', 'web development', 'web frameworks']
  SKILLS = [['programming language', 'C'], ['programming language', 'C++'], ['programming language', 'Python'], ['programming language', 'C#'], ['programming language', 'R'], ['programming language', 'PHP'], ['programming language', 'MATLAB'], ['programming language', 'Swift'], ['programming language', 'Objective-C'], ['programming language', 'Assembly'], ['programming language', 'Perl'], ['programming language', 'Ruby'], ['programming language', 'Delphi / Object Pascal'], ['programming language', 'Go'], ['programming language', 'Scratch'], ['programming language', 'PL/SQL'], ['programming language', 'Visual Basic'], ['programming language', 'Elixir'], ['Web development', 'html'], ['Web development', 'css'], ['Web frameworks', 'Rails'], ['Web frameworks', 'Phoenix'], ['Web frameworks', 'Django'], ['Web frameworks', 'Sinatra'], ['cloud infrastructure', 'AWS'], ['cloud infrastructure', 'Google Cloud Platform'], ['cloud infrastructure', 'IBM Cloud'], ['cloud infrastructure', 'Rackspace'], ['cloud infrastructure', 'Verizon Cloud'], ['soluções AWS', 'rds'], ['soluções AWS', 'aurora'], ['soluções AWS', 'athena'], ['soluções AWS', 'RedShift'], ['soluções AWS', 'DynamoDB'], ['soluções AWS', 'ElastiCache'], ['soluções AWS', 'CloudFront'], ['soluções AWS', 'S3'], ['soluções AWS', 'Lambda'], ['Elastic Stack', 'ElasticSearch'], ['Elastic Stack', 'Logstash'], ['Elastic Stack', 'Kibana'], ['Conteinerização', 'Docker'], ['Conteinerização', 'Kubernetes'], ['Bancos de dados SQL', 'postgresql'], ['Bancos de dados SQL', 'MySQL'], ['Bancos de dados NoSQL', 'Redis'], ['Bancos de dados NoSQL', 'Mongo'], ['Ferramentas de provisionamento', 'Puppet'], ['Ferramentas de provisionamento', 'Chef'], ['sistema operacional', 'windows'], ['sistema operacional', 'linux'], ['Virtualização', 'Xen'], ['analytics', 'machine learning'], ['MS Office', 'Powerpoint'], ['MS Office', 'excel'], ['MS Office', 'word'], ['MS Office', 'access'], ['comercial', 'telemarketing'], ['comercial', 'contorno de objeção'], ['comercial', 'senso de urgência'], ['pessoal', 'raciocínio lógico'], ['pessoal', 'QI'], ['pessoal', 'comunicação verbal'], ['pessoal', 'controle emocional'], ['pessoal', 'persistência'], ['pessoal', 'persuasão'], ['pessoal', 'problem solving'], ['pessoal', 'comunicação escrita'], ['pessoal', 'auto-gerenciamento'], ['pessoal', 'pró-atividade'], ['pessoal', 'Planejamento'], ['pessoal', 'Negociação'], ['pessoal', 'criatividade'], ['pessoal', 'responsabilidade'], ['pessoal', 'carisma'], ['pessoal', 'estratégico'], ['pessoal', 'ambição'], ['pessoal', 'empatia'], ['pessoal', 'experiência'], ['pessoal', 'conformidade'], ['pessoal', 'organização'], ['pessoal', 'controle'], ['pessoal', 'dominância'], ['pessoal', 'decisão'], ['pessoal', 'autonomia'], ['pessoal', 'envolvimento'], ['pessoal', 'auto-controle'], ['pessoal', 'consideração'], ['pessoal', 'realização'], ['pessoal', 'abertura'], ['pessoal', 'auto-exposição'], ['pessoal', 'auto-confiança'], ['pessoal', 'motilidade'], ['pessoal', 'ritmo'], ['pessoal', 'administração do tempo'], ['pessoal', 'confrontação'], ['pessoal', 'delegação'], ['pessoal', 'tônus'], ['pessoal', 'assertividade'], ['pessoal', 'flexibilidade'], ['idioma', 'Português'], ['idioma', 'Inglês'], ['idioma', 'Espanhol'], ['idioma', 'Italiano'], ['idioma', 'Francês'], ['video', 'Captação de imagem e áudio'], ['video editor', 'Adobe Premiere Pro'], ['video editor', 'Final Cut Pro X'], ['video editor', 'DaVinci Resolve'], ['video editor', 'Avid Media Composer'], ['video editor', 'Sony Vegas Pro'], ['video editor', 'Edius'], ['video editor', 'Power Director'], ['video editor', 'Openshot'], ['video editor', 'Camtasia'], ['video editor', 'Lightworks'], ['video editor', 'Pinnacle Studio'], ['video editor', 'Wondershare Video Editor'], ['video editor', 'HitFilm Express'], ['image editor', 'Illustrator'], ['image editor', 'Adobe Photoshop'], ['image editor', 'Adobe Lightroom'], ['image editor', 'Corel Paint Shop Pro'], ['image editor', 'The Gimp'], ['image editor', 'Photoscape'], ['image editor', 'Illustrator'], ['design software', 'SketchApp'], ['design software', 'Invision'], ['marketing', 'Site map'], ['marketing', 'Userflow'], ['marketing', 'Google Adwords'], ['marketing', 'Facebook Ads'], ['marketing', 'Google Analytics'], ['marketing', 'storytelling'], ['marketing', 'content marketing'], ['marketing', 'inbound marketing'], ['marketing', 'SEO'], ['Web development', 'Javascript'], ['pessoal', 'trabalho em equipe'], ['Bancos de dados', 'Modelagem de dados'], ['Web development', 'SASS'], ['Web development', 'Bootstrap'], ['Web development', 'Material Design'], ['Web development', 'Usabilidade'], ['Web development', 'User Experience'], ['Web development', 'User Interface']]
  COMPETENCES = [['dev', 'Backend'], ['dev', 'Frontend'], ['product', 'Project Management'], ['personal', 'Pessoal'], ['personal', 'Liderança'], ['comercial', 'Comercial'], ['tech', 'Análise de Dados']]
  DEPARTMENTS = ['Engenharia', 'Produto', 'Marketing', 'Relacionamento', 'Financeiro']
  JOBS = [['Desenvolvedor Back-end', 'Engenharia'], ['Desenvolvedor Front-end', 'Engenharia'], ['Product Owner', 'Produto'], ['Product Manager', 'Produto'], ['Tech Lead', 'Engenharia'], ['BI Analyst', 'Marketing'], ['Guia do Aluno - Chat', 'Relacionamento'], ['Guia do Aluno - Telefone', 'Relacionamento'], ['Líder de Vendas', 'Relacionamento'], ['UX/UI Designer', 'Marketing'], ['Analista de Performance', 'Marketing'], ['Jornalista', 'Marketing'], ['Operações', 'Engenharia']]

  def up
    FAMILIES.each do |f|
      Family.create(key: f)
    end

    SKILLS.each do |f, s|
      family = Family.find_by(key: f)
      Skill.create(description: s, family: family)
    end

    COMPETENCES.each do |n, a|
      Competence.create(name: n, area: a)
    end

    DEPARTMENTS.each do |d|
      Department.create(name: d)
    end

    JOBS.each do |j, d|
      department = Department.find_by(name: d)
      Job.create(name: j, department: department)
    end
  end

  def down
    Family.destroy_all
    Skill.destroy_all
    Competence.destroy_all
    Department.destroy_all
    Job.destroy_all
  end
end
