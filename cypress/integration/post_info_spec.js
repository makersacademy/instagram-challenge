describe("See post info", () => {
  it("A user can click a post to see more info", () => {
    cy.visit("/users/new");
    cy.get("#email").type("someone6@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();
    cy.get(".newpost").click();

    cy.get("#url").type("https://i.imgur.com/eQGmX4X.jpeg");
    cy.get("#caption").type("this is a picture");
    cy.get(".createpost").click();

    cy.get('div[class="posts"]').first().find(".postimage").click()
    cy.url().should("include", "/posts");
    cy.contains("someone6@example.com: this is a picture")
  });
});
