describe("Authentication", () => {
  it("A user signs in and is redirected to /posts", () => {
    // sign up
    cy.visit("/users/new");
    cy.get("#email").type("someone1@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    cy.url().should("include", "/posts");
    cy.contains("Hey someone1@example.com");
  });
});
