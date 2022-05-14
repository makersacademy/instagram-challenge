describe("Create post", () => {
  it("A user can create a post", () => {
    cy.visit("/users/new");
    cy.get("#email").type("someone5@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();
    cy.get(".newpost").click();

    cy.get("#url").type("https://i.imgur.com/eQGmX4X.jpeg");
    cy.get("#caption").type("this is a picture");
    cy.get(".createpost").click();

    cy.url().should("include", "/posts");
    cy.get('div[class="posts"]').find(".postimage").should('be.visible');
  });
});
