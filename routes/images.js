const express = require("express");
const router = express.Router();

const ImagesController = require("../controllers/images");

router.get("/", ImagesController.Index);
router.post("/", ImagesController.Create);
router.get("/new", ImagesController.New);
router.post("/like/:id", ImagesController.Like);

module.exports = router;
