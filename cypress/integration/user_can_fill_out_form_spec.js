describe('Form', function() {
  it('contains input', function() {
    cy.visit('/');
    cy.get('#nameInput').type('Jimmy').should('have.value', 'Jimmy');
    cy.get('#captionInput').type('Lovely day').should('have.value', 'Lovely day');
    cy.get('#submitButton').should('have.value', 'submit')
  })
})
