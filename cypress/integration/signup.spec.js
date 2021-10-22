/// <reference types="cypress" />

describe("The Signup Page", () => {
  // beforeEach(() => {
  // })
  it("contains sign up form", () => {
    cy.visit("http://localhost:3000/signup");
    cy.get("#username").type("blahdeblah");
    cy.get("#password").type("blahdeblah");
    cy.get("#email").type("blah@blah.com");
    cy.get("#newUser").submit();
    cy.contains("this is the first post");
  });
});
