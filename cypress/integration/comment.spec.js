describe('The Home Page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/');
    cy.get('#username').type('test');
    cy.get('#password').type('test');
    cy.get('#loginUser').submit();
    cy.get('#newPostText').type('this is a feature test post');
    cy.get('#newPost').submit();
    cy.contains('View').click();
    cy.get('#newCommentText').type('this is a feature test comment');
    cy.get('#newComment').submit();
  });

  it('shows comment', () => {
    cy.contains('this is a feature test comment');
  });
});
