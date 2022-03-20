const express = require("express");
const router = express.Router();

const UploadController = require("../controllers/upload");

  router.post("/", UploadController.Create);
  router.get("/files", UploadController.Get);
  router.get("/files/:name", UploadController.Download);

module.exports = router;



