import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor'

Given('o usuário está na página de login', () => {
    cy.visit('/login');
})

When('ele preenche o campo {string} com {string}', (campo, valor) => {
    const campos = {
        'E-mail': '[data-test="input-loginEmail"]',
        'Senha': '[data-test="input-loginPassword"]'
    }
    cy.get(campos[campo]).should('be.visible').type(valor);
})

When('ele não preenche o campo {string}', (campo) => {
    // não faz nada, para steps negativos
})

When('ele clica no botão {string}', (botao) => {
    const botoes = {
        'Entrar': '[data-test="submit-button"]',
        'Esqueci minha senha': '.register__forgot'
    }
    cy.get(botoes[botao]).should('be.visible').click();
})

Then('ele deve ver a mensagem de erro {string}', (mensagem) => {
    cy.contains(mensagem, { timeout: 10000 }).should('be.visible');
})

Then('ele deve ser redirecionado para a página home da página com todos os animais disponíveis para adoção', () => {
    cy.url({ timeout: 5000 }).should('exist');
    cy.contains('Veja os amigos disponíveis para adoção!').should('be.visible')
})