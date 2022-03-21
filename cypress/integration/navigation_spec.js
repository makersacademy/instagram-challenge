describe("Users are logged out", () => {
    it("Can only see the login and registration links", () => {
      cy.visit("/");
      
      cy.contains('Login').should('be.visible')
      cy.contains('Register').should('be.visible')
      cy.contains('Logout').should('not.exist')

    });

    it("Can only see the log-in and registration links", () => {
        cy.visit("/sessions/new");
        cy.get("#email").type("someone@example.com");
        cy.get("#password").type("PASSWORD");
        cy.get("#submit").click();
        
        cy.contains('Login').should('not.exist')
        cy.contains('Register').should('not.exist')
        cy.contains('Logout').should('be.visible')
        cy.contains('New image').should('be.visible')
        cy.contains('Profile').should('be.visible')
      
  
      });
  });
  
