describe("Timeline", () => {
  it("Like count on a image increases by 1", () => {
    // sign up
    cy.visit("/users/new");
    cy.get("#name").type("Sample Name");
    cy.get("#username").type("Sample Username");
    cy.get("#email").type("someone@example.com");
    cy.get("#password").type("PASSWORD");
    cy.get("#submit").click();

    // sign in
    cy.visit("/sessions/new");
    cy.get("#email").type("someone@example.com");
    cy.get("#password").type("PASSWORD");
    cy.get("#submit").click();

    // submit an image
    cy.visit("/image");
    cy.contains("New image").click();

    cy.get("#new-image-form").find('[type="text"]').type("Hello, world!");
    cy.get("#new-image-form").submit();

    cy.get(".image").first().get('#like').click();
    cy.get(".image").first().get('#likecount').should("contain", "1");
 
  });
});
