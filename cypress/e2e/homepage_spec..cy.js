describe('Homepage', () => {
  it('has a title', () => {
    cy.visit('/')
    cy.get('#title').should('contain', 'Instagram');
  })

  it('has a login button',() => {
    cy.visit('/')
    cy.get('#login-button').should('contain', 'Login');
  })

  it('has a sign up button',() => {
    cy.visit('/')
    cy.get('#signup-button').should('contain', 'Sign Up');
  })

  it('has an add post button',() => {
    cy.visit('/')
    cy.get('#add-post-button').should('contain', 'Add Post');
  })
})