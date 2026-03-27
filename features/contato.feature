Feature: Entrando em contato com responsável pela adoção
    Como usuário do sistema
    Quero acessar minha conta
    Para usar os serviços de adoção disponíveis

  Scenario: Usuário fala com responsável pela adoção
    Given usuário está logado
    When usuário clica no botão "Falar com responsável"
    And usuário preenche o campo "Nome" com "Sara Maria"
    And usuário preenche o campo "Telefone" com "62912345678"
    And usuário preenche o campo "Nome do animal" com "Sirius"
    And usuário preenche o campo "Mensagem" com "Gostaria de mais informações"
    And usuário clica no botão "Enviar"
    Then usuário deve ser redirecionado para página de adoção

 
  Scenario: Usuário faz contato sem preencher os campos
    Given usuário está logado
    When usuário clica no botão "Falar com responsável"
    And usuário não preenche o campo "Nome"
    And usuário não preenche o campo "Telefone"
    And usuário não preenche o campo "Nome do animal"
    And usuário não preenche o campo "Mensagem"
    And usuário clica no botão "Enviar"
    Then usuário deve ver a mensagem de erro "É necessário informar seu nome"

  Scenario: Usuário faz contato com formato incorreto de telefone
    Given usuário está logado
    When usuário clica no botão "Falar com responsável"
    And usuário preenche o campo "Nome" com "Sara"
    And usuário preenche o campo "Telefone" com "123456789"
    And usuário clica no botão "Enviar"
    Then usuário deve ver a mensagem de erro "Por favor, verifique o número digitado"

  Scenario: Usuário faz contato preenchendo o campo Nome com muitos caracteres
    Given usuário está logado
    When usuário clica no botão "Falar com responsável"
    And usuário preenche o campo "Nome" com "Sara Maria de Almeida dos Santos da Fonseca"
    And usuário preenche o campo "Nome do animal" com "Sirius"
    And usuário clica no botão "Enviar"
    Then usuário deve ver a mensagem de erro "O número máximo de caracteres é 40"

  Scenario: Usuário faz contato preenchendo o campo Nome do animal com muitos caracteres
    Given usuário está logado
    When usuário clica no botão "Falar com responsável"
    And usuário preenche o campo "Nome" com "Sara"
    And usuário preenche o campo "Nome do animal" com "Sirius, Dunga, Yoda e Amora"
    And usuário clica no botão "Enviar"
    Then usuário deve ver a mensagem de erro "O número máximo de caracteres é 25"