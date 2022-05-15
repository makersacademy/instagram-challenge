describe("Homepage", () => {
  it("has a title and welcome message", () => {
    cy.visit("/");
    cy.get(".title").should("contain", "Fakestagram");
    cy.contains("Welcome to Fakestagram");
  });

  it("has a link to the sign up page", () => {
    cy.visit("/");
    cy.get('.link').click();
    cy.url().should("contain", "/users/new");
  });
});