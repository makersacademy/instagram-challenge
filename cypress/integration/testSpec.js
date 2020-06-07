describe('First test', function() {
  it('has "Pinstagram" on page', function() {
    cy.visit('/');
    cy.contains('Pinstagram');
  })
})
