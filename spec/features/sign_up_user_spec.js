describe('Sign Up User', function() {
  beforeEach(function() {
    cy.exec('rails db:truncate_all')
  })
  it('Logs the user in after success', function() {
    cy.visit('/')
    cy.get('#email-input').type('test@cypress.com')
    cy.get('#password-input').type('password')
    cy.get('#password_confirmation-input').type('password')
    cy.get('#signup-btn').click()
    cy.url().should('include', '/posts')
    cy.contains('test@cypress.com')
  })
})