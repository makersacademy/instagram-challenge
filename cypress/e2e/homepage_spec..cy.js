describe('Homepage', () => {
  it('has a title', () => {
    cy.visit('/')
    cy.get('#title').should('contain', 'Instagram');
  })

  it('has a login button',() => {
    cy.visit('/')
    cy.get('#login-button').should('contain', 'Login');
  })
})