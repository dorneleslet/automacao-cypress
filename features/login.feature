Feature: Login do usuário
    Como usuário do sistema
    Quero acessar minha conta
    Para poder usar os serviços disponíveis

  Scenario: Usuário faz login com dados corretos
    Given o usuário está na página de login
    When ele preenche o campo "E-mail" com "sara.maria@email.com"
    And ele preenche o campo "Senha" com "Senha123"
    And ele clica no botão "Entrar"
    Then ele deve ser redirecionado para a página home da página com todos os animais disponíveis para adoção

  Scenario: Usuário faz login com sem dados
    Given o usuário está na página de login
    When ele não preenche o campo "E-mail"
    And ele não preenche o campo "Senha"
    And ele clica no botão "Entrar"
    Then ele deve ver a mensagem de erro "É necessário informar um endereço de email"

  Scenario: Usuário faz login com formato de email incorreto
    Given o usuário está na página de login
    When ele preenche o campo "E-mail" com "sara.maria"
    And ele preenche o campo "Senha" com "Senha123"
    Then ele deve ver a mensagem de erro "Por favor, verifique o email digitado"

  Scenario: Usuário faz login com email incorreto
    Given o usuário está na página de login
    When ele preenche o campo "E-mail" com "sara.maria@teste.com"
    And ele preenche o campo "Senha" com "Senha123"
    And ele clica no botão "Entrar"
    Then ele deve ver a mensagem de erro "Falha no login. Consulte suas credenciais"

  Scenario: Usuário faz login com senha incorreta
    Given o usuário está na página de login
    When ele preenche o campo "E-mail" com "sara.maria@esail.com"
    And ele preenche o campo "Senha" com "Senha123456"
    And ele clica no botão "Entrar"
    Then ele deve ver a mensagem de erro "Falha no login. Consulte suas credenciais"

  Scenario: Usuário faz login sem preencher senha
    Given o usuário está na página de login
    When ele preenche o campo "E-mail" com "sara.maria@esail.com"
    And ele não preenche o campo "Senha"
    And ele clica no botão "Entrar"
    Then ele deve ver a mensagem de erro "Insira sua senha"

  Scenario: Usuário clica em "esqueci minha senha"
    Given o usuário está na página de login
    When ele preenche o campo "E-mail" com "sara.maria@email.com"
    And ele clica no botão "Esqueci minha senha"
    Then ele deve ser redirecionado para a página de recuperação de senha