describe('user can upload image', function() {
  it('will upload image', function() {
    cy.visit('/posts');
    cy.get('#submitButton').click();
    cy.contains('Upload successful');
  })
})
