describe("Registration", () => {
  it("A user signs out and is redirected to sign in page", () => {
    // sign up
    cy.visit("/users/new");
    cy.get("#email").type("someone3@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();
    cy.get(".logout").click();

    cy.url().should("include", "/sessions");
    cy.should("not.contain", "Hey someone3@example.com");
  });
});
