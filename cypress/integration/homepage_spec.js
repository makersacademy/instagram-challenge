describe("Homepage", () => {
  it("has a title and welcome message", () => {
    cy.visit("/");
    cy.get(".title").should("contain", "Fakestagram");
    cy.contains("Welcome to Fakestagram");
  });
});