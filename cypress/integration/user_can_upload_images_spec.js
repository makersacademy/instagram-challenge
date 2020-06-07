describe('user can upload image', function() {
  it('will upload image', function() {
    cy.visit('/posts');
    cy.get('#new-post-form').submit();

    cy.contains('Upload successful');
  })
})
