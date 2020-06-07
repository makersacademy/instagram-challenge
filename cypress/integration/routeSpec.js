describe('signup route', function() {
  it('says Sign up on the page', function() {
    cy.visit('/signup');
    cy.contains('Sign up');
  })
  it('says Posts on the page', function() {
    cy.visit('/posts');
    cy.contains('Posts');
  })
})
