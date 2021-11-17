/// <reference types="cypress" />

describe("Login Page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/login");
  });

  it("logs in with correct credentials", () => {
    cy.get("#username").type("test");
    cy.get("#password").type("test");
    cy.get("#loginUser").submit();
    cy.contains("this is the first post");
  });

  it("notifies user of incorrect username", () => {
    cy.get("#username").type("wrong-username");
    cy.get("#password").type("test");
    cy.get("#loginUser").submit();
    cy.contains("Incorrect username");
  });

  it("notifies user of incorrect password", () => {
    cy.get("#username").type("test");
    cy.get("#password").type("Incorrect password");
    cy.get("#loginUser").submit();
    cy.contains("Incorrect password");
  });
});
