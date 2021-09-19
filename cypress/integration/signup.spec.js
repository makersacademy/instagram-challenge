/// <reference types="cypress" />

// To learn more about how Cypress works and
// what makes it such an awesome testing tool,
// please read our getting started guide:
// https://on.cypress.io/introduction-to-cypress

describe('The Signup Page', () => {

  // beforeEach(() => {
  // })
  it('contains sign up form', () => {
    cy.visit('http://localhost:3000/signup')
    cy.get('#newUserUsername').type('blahdeblah')
    cy.get('#newUserPassword').type('blahdeblah')
    cy.get('#newUserEmail').type('blah@blah.com')
    cy.get('#newUser').submit()
    cy.contains("this is the first post of instagram_clone")
  })
})
