/// <reference types="cypress" />

describe('The Home Page', () => {
  // beforeAll(() => {
  // })

  it('shows posts', () => {
    cy.visit('http://localhost:3000/');
    cy.get('#username').type('test');
    cy.get('#password').type('test');
    cy.get('#loginUser').submit();
    cy.contains('Hello, test!');
    cy.contains('this is the first post');
  });

  it('adds post', () => {
    cy.visit('http://localhost:3000/');
    cy.get('#username').type('test');
    cy.get('#password').type('test');
    cy.get('#loginUser').submit();
    cy.get('#newPostText').type('this is a test post');
    cy.get('#newPost').submit();
    cy.contains('this is a test post');
  });

  it('shows individual post', () => {
    // this is only checking route atm and shouldn't be accessible until user is logged in
    cy.visit('http://localhost:3000/posts/id');
    cy.contains('Hello show posts route');
  });
});
