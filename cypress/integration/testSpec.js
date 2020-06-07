describe('First test', function() {
  it('has "hello world" on page', function() {
    cy.visit('/');
    cy.contains('Pinstagram');
  })
})
