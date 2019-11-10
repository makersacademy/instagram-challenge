describe('Home Page', function() {
  beforeEach(function() {
    cy.visit('/')
  })
  it('shows the sign up form', function() {
    cy.get('body').contains('Kevstagram')
    cy.get('body').contains('Sign Up')
    cy.get('body').contains('Log In')
    cy.url().should('include', '/sign_up')
  })
  
  it('can show the login page', function() {
    cy.get('#login-btn').click()
    cy.get('body').contains('Log In')
    cy.url().should('include', '/log_in')
  })
})