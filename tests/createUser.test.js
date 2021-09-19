describe("Express Index", () => {
  beforeAll(async () => {
    // The port is 4444 here because it is your test server, not your real one
    await page.goto("http://localhost:4444/users/new");
  });

  it("has a user sign up form", async () => {
    await expect(page).toMatchElement("title", {
      text: "Create a new account",
    });
    await expect(page).toMatchElement("name");
    await expect(page).toMatchElement("email");
    await expect(page).toMatchElement("password");
    await expect(page).toMatchElement("#submit-button", { text: "Sign Up" });
  });
});
