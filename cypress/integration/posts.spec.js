/// <reference types="cypress" />

describe('The Home Page', () => {

  // beforeAll(() => {
  // })

  it('shows posts', () => {
    cy.visit('http://localhost:3000/posts')
    cy.contains("Hello posts route")
    cy.contains("this is the first post of instagram_clone")
  })

  it('adds post', () => {
    cy.visit('http://localhost:3000/posts')
    cy.get('#newPostText').type('this is a test post')
    cy.get('#newPost').submit()
    cy.contains("blahdeblah")
  })



  it('shows individual post', () => {
    cy.visit('http://localhost:3000/posts/id')
    cy.contains("Hello show posts route") 
  })
})
