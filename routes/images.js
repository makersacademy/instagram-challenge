const express = require("express");
const router = express.Router();

const ImagesController = require("../controllers/images");

router.get("/", ImagesController.Index);
router.post("/", ImagesController.Create);
router.get("/new", ImagesController.New);
router.post("/like/:id", ImagesController.Like);
// router.get("/files", ImagesController.Get);
// router.get("/files/:name", ImagesController.Download);

module.exports = router;
