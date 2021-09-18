/// <reference types="cypress" />

describe('The Home Page', () => {

  // beforeEach(() => {
  // })

  it('shows posts', () => {
    cy.visit('http://localhost:3000/posts')
    cy.contains("Hello posts route") 
  })

  it('shows individual post', () => {
    cy.visit('http://localhost:3000/posts/id')
    cy.contains("Hello show posts route") 
  })
})
