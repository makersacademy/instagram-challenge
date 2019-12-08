describe('Log In', function() {
  beforeEach(function() {
    cy.exec('rails db:seed')
  })
  it('logs the user in', function() {
    cy.visit('/')
    cy.get('#login-btn').click()
    cy.get('#email-input').type('test@cypress.com')
    cy.get('#password-input').type('password')
    cy.get('#login-btn').click()
    cy.contains('test@cypress.com')
  })
})