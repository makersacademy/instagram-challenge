describe("Timeline", () => {
  it("can submit posts, when signed in, and view them", () => {
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
    cy.visit("/images");
    cy.contains("New image").click();

    cy.get("#new-image-form").find('[type="text"]').type("Hello, world!");
    cy.get("#new-image-form").submit();

    cy.get(".images").should("contain", "Hello, world!");
    
    cy.get(".images").get("#createdAt").then((test) =>{
      const currentTime = Date.now();
      const postedTime = Date.parse(test.text())
      cy.log(currentTime)
      cy.log(postedTime)
    })
 
  });
});
