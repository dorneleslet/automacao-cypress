import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor'

Given('o usuário está na página de cadastro', () => {
    cy.visit('/cadastro');
})

When('preenche o campo {string} com {string}', (campo, valor) => {
    const campos = {
        'Nome': '[data-test="input-name"]',
        'E-mail': '[data-test="input-email"]',
        'Senha': '[data-test="input-password"]',
        'Confirme sua senha': '[data-test="input-confirm-password"]',
    }
    cy.get(campos[campo]).should('be.visible').type(valor);
})

When('não preenche o campo {string}', (campo) => {
    // não faz nada, para steps negativos
})

When('clica no botão {string}', (botao) => {
    const botoes = {
        'Cadastrar': '[data-test="submit-button"]',
    }
    cy.get(botoes[botao]).should('be.visible').click();
})

Then('deve ser redirecionado para a página de login', () => {
    cy.url().should('include', '/login');
    cy.contains('Já tem conta? Faça seu login:').should('be.visible');
})

Then('deve ver a mensagem de erro {string}', (mensagem) => {
    cy.contains(mensagem, { timeout: 10000 }).should('be.visible');
})