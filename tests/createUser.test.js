describe("Create a new user", () => {
  beforeAll(async () => {
    // The port is 4444 here because it is your test server, not your real one
    await page.goto("http://localhost:4444/users/new");
  });

  it("allows a user to fill in form and sign up", async () => {
    await expect(page).toMatchElement("title", {
      text: "Create a new account",
    });
    await expect(page).toFillForm('form[id="form1"]', {
      name: "Edward",
      email: "ed@example.com",
      password: "123456",
    });
    await page.click("#submit");
    await page.waitForNavigation();
    expect(page.url()).toEqual("http://localhost:4444/users");
  });
});
