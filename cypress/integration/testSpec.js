describe('First test', function() {
  it('has "Posts" on page', function() {
    cy.visit('/');
    cy.contains('Posts');
  })
})
