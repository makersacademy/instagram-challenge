describe('user can upload image', function() {
  it('will upload image', function() {
    cy.visit('/');
    cy.get('#nameInput').type('Jimmy')
    cy.get('#captionInput').type('Lovely day')
    cy.get('#submitButton').click();
    cy.contains('Upload successful');
  })
})
