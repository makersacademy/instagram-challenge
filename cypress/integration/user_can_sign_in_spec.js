describe("Authentication", () => {
  it("A user signs in and is redirected to /images", () => {
    // sign up
    cy.visit("/users/new");
    cy.get("#name").type("name");
    cy.get("#username").type("Sample Username");
    cy.get("#email").type("someone@example.com");
    cy.get("#password").type("PASSWORD");
    cy.get("#submit").click();

    // sign in
    cy.visit("/sessions/new");
    cy.get("#email").type("someone@example.com");
    cy.get("#password").type("PASSWORD");
    cy.get("#submit").click();

    cy.url().should("include", "/images");
    cy.contains("a", "New image");
  });
});
