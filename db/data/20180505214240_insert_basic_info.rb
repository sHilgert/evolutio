class InsertBasicInfo < SeedMigration::Migration
  FAMILIES = ['analytics', 'bancos de dados', 'bancos de dados sql', 'cloud infrastructure', 'comercial', 'conteinerização', 'design software', 'elastic stack', 'ferramentas de provisionamento', 'idioma', 'image editor', 'marketing', 'ms office', 'pessoal', 'programming language', 'sistema operacional', 'soluções aws', 'video', 'video editor', 'virtualização', 'web development', 'web frameworks']
  SKILLS = [['programming language', 'c'], ['programming language', 'c++'], ['programming language', 'python'], ['programming language', 'c#'], ['programming language', 'r'], ['programming language', 'php'], ['programming language', 'matlab'], ['programming language', 'swift'], ['programming language', 'objective-c'], ['programming language', 'assembly'], ['programming language', 'perl'], ['programming language', 'ruby'], ['programming language', 'delphi / object pascal'], ['programming language', 'go'], ['programming language', 'scratch'], ['programming language', 'pl/sql'], ['programming language', 'visual basic'], ['programming language', 'elixir'], ['web development', 'html'], ['web development', 'css'], ['web frameworks', 'rails'], ['web frameworks', 'phoenix'], ['web frameworks', 'django'], ['web frameworks', 'sinatra'], ['cloud infrastructure', 'aws'], ['cloud infrastructure', 'google cloud platform'], ['cloud infrastructure', 'ibm cloud'], ['cloud infrastructure', 'rackspace'], ['cloud infrastructure', 'verizon cloud'], ['soluções aws', 'rds'], ['soluções aws', 'aurora'], ['soluções aws', 'athena'], ['soluções aws', 'redshift'], ['soluções aws', 'dynamodb'], ['soluções aws', 'elasticache'], ['soluções aws', 'cloudfront'], ['soluções aws', 's3'], ['soluções aws', 'lambda'], ['elastic stack', 'elasticsearch'], ['elastic stack', 'logstash'], ['elastic stack', 'kibana'], ['conteinerização', 'docker'], ['conteinerização', 'kubernetes'], ['bancos de dados sql', 'postgresql'], ['bancos de dados sql', 'mysql'], ['bancos de dados nosql', 'redis'], ['bancos de dados nosql', 'mongo'], ['ferramentas de provisionamento', 'puppet'], ['ferramentas de provisionamento', 'chef'], ['sistema operacional', 'windows'], ['sistema operacional', 'linux'], ['virtualização', 'xen'], ['analytics', 'machine learning'], ['ms office', 'powerpoint'], ['ms office', 'excel'], ['ms office', 'word'], ['ms office', 'access'], ['comercial', 'telemarketing'], ['comercial', 'contorno de objeção'], ['comercial', 'senso de urgência'], ['pessoal', 'raciocínio lógico'], ['pessoal', 'qi'], ['pessoal', 'comunicação verbal'], ['pessoal', 'controle emocional'], ['pessoal', 'persistência'], ['pessoal', 'persuasão'], ['pessoal', 'problem solving'], ['pessoal', 'comunicação escrita'], ['pessoal', 'auto-gerenciamento'], ['pessoal', 'pró-atividade'], ['pessoal', 'planejamento'], ['pessoal', 'negociação'], ['pessoal', 'criatividade'], ['pessoal', 'responsabilidade'], ['pessoal', 'carisma'], ['pessoal', 'estratégico'], ['pessoal', 'ambição'], ['pessoal', 'empatia'], ['pessoal', 'experiência'], ['pessoal', 'conformidade'], ['pessoal', 'organização'], ['pessoal', 'controle'], ['pessoal', 'dominância'], ['pessoal', 'decisão'], ['pessoal', 'autonomia'], ['pessoal', 'envolvimento'], ['pessoal', 'auto-controle'], ['pessoal', 'consideração'], ['pessoal', 'realização'], ['pessoal', 'abertura'], ['pessoal', 'auto-exposição'], ['pessoal', 'auto-confiança'], ['pessoal', 'motilidade'], ['pessoal', 'ritmo'], ['pessoal', 'administração do tempo'], ['pessoal', 'confrontação'], ['pessoal', 'delegação'], ['pessoal', 'tônus'], ['pessoal', 'assertividade'], ['pessoal', 'flexibilidade'], ['idioma', 'português'], ['idioma', 'inglês'], ['idioma', 'espanhol'], ['idioma', 'italiano'], ['idioma', 'francês'], ['video', 'captação de imagem e áudio'], ['video editor', 'adobe premiere pro'], ['video editor', 'final cut pro x'], ['video editor', 'davinci resolve'], ['video editor', 'avid media composer'], ['video editor', 'sony vegas pro'], ['video editor', 'edius'], ['video editor', 'power director'], ['video editor', 'openshot'], ['video editor', 'camtasia'], ['video editor', 'lightworks'], ['video editor', 'pinnacle studio'], ['video editor', 'wondershare video editor'], ['video editor', 'hitfilm express'], ['image editor', 'illustrator'], ['image editor', 'adobe photoshop'], ['image editor', 'adobe lightroom'], ['image editor', 'corel paint shop pro'], ['image editor', 'the gimp'], ['image editor', 'photoscape'], ['image editor', 'illustrator'], ['design software', 'sketchapp'], ['design software', 'invision'], ['marketing', 'site map'], ['marketing', 'userflow'], ['marketing', 'google adwords'], ['marketing', 'facebook ads'], ['marketing', 'google analytics'], ['marketing', 'storytelling'], ['marketing', 'content marketing'], ['marketing', 'inbound marketing'], ['marketing', 'seo'], ['web development', 'javascript'], ['pessoal', 'trabalho em equipe'], ['bancos de dados', 'modelagem de dados'], ['web development', 'sass'], ['web development', 'bootstrap'], ['web development', 'material design'], ['web development', 'usabilidade'], ['web development', 'user experience'], ['web development', 'user interface']]
  COMPETENCES = [['dev', 'Back-end'], ['dev', 'Front-end'], ['product', 'Project Management'], ['personal', 'Pessoal'], ['personal', 'Liderança'], ['comercial', 'Comercial'], ['tech', 'Análise de Dados']]
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

    COMPETENCES.each do |a, n|
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
