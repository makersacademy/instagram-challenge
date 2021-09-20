/// <reference types="cypress" />

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
