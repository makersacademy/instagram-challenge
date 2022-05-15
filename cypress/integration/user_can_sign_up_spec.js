describe("Sign up", () => {
  it("allows users to sign up with their details", () => {
    cy.visit("/users/new");
    cy.get("#username").type("person1");
    cy.get("#email").type("person1@email.co.uk");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    cy.url().should("eq", "http://localhost:3030/")
  });
});