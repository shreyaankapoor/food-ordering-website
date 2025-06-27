const request = require("supertest");
const express = require("express");
const indexRouter = require("../routes/index");

const app = express();
app.set("view engine", "pug"); // or your actual view engine
app.use("/", indexRouter);

describe("GET /", () => {
  it("should return 200 OK", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
  });
});
