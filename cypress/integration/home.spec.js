/// <reference types="cypress" />

// To learn more about how Cypress works and
// what makes it such an awesome testing tool,
// please read our getting started guide:
// https://on.cypress.io/introduction-to-cypress

describe("The Home Page", () => {
  // beforeEach(() => {
  // })

  it("shows home page", () => {
    cy.visit("http://localhost:3000");
    cy.contains("Posts");
    // change URL to match your dev URL
  });
});
