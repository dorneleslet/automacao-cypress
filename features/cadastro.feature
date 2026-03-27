Feature: Cadastro válido na página
    Como interessado no serviço prestado do sistema
    Quero criar uma conta
    Para poder usar os serviços disponíveis

  Scenario: Usuário faz cadastro com credenciais válidas
    Given o usuário está na página de cadastro
    When preenche o campo "Nome" com "Sara Maria"
    And preenche o campo "E-mail" com "mariasara@email.com"
    And preenche o campo "Senha" com "Senha123"
    And preenche o campo "Confirme sua senha" com "Senha123"
    And clica no botão "Cadastrar"
    Then deve ser redirecionado para a página de login

  Scenario: Usuário faz cadastro sem email
    Given o usuário está na página de cadastro
    When preenche o campo "Nome" com "Sara Maria"
    And não preenche o campo "E-mail"
    And preenche o campo "Senha" com "Senha123"
    And preenche o campo "Confirme sua senha" com "Senha123"
    And clica no botão "Cadastrar"
    Then deve ver a mensagem de erro "É necessário informar um endereço de email"

  Scenario: Usuário faz cadastro sem senha
    Given o usuário está na página de cadastro
    When preenche o campo "Nome" com "Sara Maria"
    And preenche o campo "E-mail" com "saram@email.com"
    And não preenche o campo "Senha"
    And preenche o campo "Confirme sua senha" com "Senha123"
    And clica no botão "Cadastrar"
    Then deve ver a mensagem de erro "Crie uma senha"

  Scenario: Usuário faz cadastro sem confirmar a senha
    Given o usuário está na página de cadastro
    When preenche o campo "Nome" com "Sara Maria"
    And preenche o campo "E-mail" com "saram@email.com"
    And preenche o campo "Senha" com "Senha123"
    And não preenche o campo "Confirme sua senha"
    And clica no botão "Cadastrar"
    Then deve ver a mensagem de erro "Repita a senha criada acima"

  Scenario: Usuário faz cadastro sem preencher nome
    Given o usuário está na página de cadastro
    When não preenche o campo "Nome"
    And preenche o campo "E-mail" com "sofia@email.com"
    And preenche o campo "Senha" com "Senha123"
    And preenche o campo "Confirme sua senha" com "Senha123"
    And clica no botão "Cadastrar"
    Then deve ver a mensagem de erro "É necessário informar seu nome"

  Scenario: Usuário faz cadastro com senhas errada na confirmação
    Given o usuário está na página de cadastro
    When preenche o campo "Nome" com "Sofia"
    And preenche o campo "E-mail" com "sofia@email.com"
    And preenche o campo "Senha" com "Senha123"
    And preenche o campo "Confirme sua senha" com "Senhna123"
    And clica no botão "Cadastrar"
    Then deve ver a mensagem de erro "As senhas não batem"