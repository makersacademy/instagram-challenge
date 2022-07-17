require('cypress-file-upload');

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
    cy.get('input[type=file]').attachFile('../test-image/image-for-test.png');
    cy.get('button').click();
    cy.get('#title').should('contain', 'Instagram');
    cy.get('.image-name').last().should('contain', 'Fake photo');
    // fails because you have to upload a photo for it to work
  })

})
