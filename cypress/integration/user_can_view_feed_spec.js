describe('Feed', function() {
  it('shows all posts', function() {
    cy.clock(1594977108368);
    cy.visit('/');
    cy.get('.feedContainer').should('contain', 'Zsofi');
    cy.get('.feedContainer').should('contain', '3 days ago');
    cy.get('.feedContainer').should('contain', 'Trekking in the Himalayas');
  })
})
