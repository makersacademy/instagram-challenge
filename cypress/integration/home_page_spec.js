describe("Home page", () => {
  it("has a sign in form", () => {
    cy.visit("/");
    cy.get("#new-session-form").should("contain", "Log in");
  });
});
