describe('user can add post',() => {
  it('shows the user a form to upload an image',() => {
    cy.visit('/')
    cy.get('#add-post-button').click()
    cy.get('#name')
    cy.get('#desc')
    cy.get('#image')
    cy.get('button')
  })

  it('allows the user to upload an image that shows on homepage - testing desc and title only',() => {
    cy.visit('/')
    cy.get('#add-post-button').click()
    cy.get('#name').type('Fake photo');
    cy.get('#desc').type('A lovely photo');
    cy.get('button').click();
    cy.get('#title').should('contain', 'Instagram');
    cy.get('div.image').first().should('contain', 'Fake Photo');
    // fails because you have to upload a photo for it to work
  })

})
