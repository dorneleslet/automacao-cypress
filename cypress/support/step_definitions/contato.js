import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor'

Given('usuário está logado', () => {
    cy.visit('/login')
    cy.get('[data-test="input-loginEmail"]').type('sara.maria@email.com');
    cy.get('[data-test="input-loginPassword"]').type('Senha123');
    cy.get('[data-test="submit-button"]').click();

    cy.url().should('include', '/home')
})

When('usuário preenche o login {string} com {string}', (campo, valor) => {
    const campos = {
        'E-mail': '[data-test="input-loginEmail"]',
        'Senha': '[data-test="input-loginPassword"]'
    }
    cy.get(campos[campo]).should('be.visible').type(valor);
})

When('usuário preenche o campo {string} com {string}', (campo, valor) => {
    const campos = {
        'Nome': '#name',
        'Telefone': '#phone',
        'Nome do animal': '#petName',
        'Mensagem': '#msg',
    }
    cy.get(campos[campo]).should('be.visible').type(valor);
})

When('usuário não preenche o campo {string}', (campo) => {
    // não faz nada, um step vazio para testes negativos
})

When('usuário clica no botão {string}', (botao) => {
    const botoes = {
        'Entrar': '[data-test="submit-button"]',
        'Enviar': '[data-test="submit-button"]',
        'Falar com responsável': '.card__contact',
    }
    cy.get(botoes[botao]).should('be.visible').first().click();
})

Then('usuário deve ver a mensagem de erro {string}', (mensagem) => {
    cy.contains(mensagem, { timeout: 10000 }).should('be.visible');
})

Then('usuário deve ser redirecionado para página de adoção', () => {
    cy.url().should('include', '/home');
    cy.contains('Veja os amigos disponíveis para adoção!').should('be.visible');
})