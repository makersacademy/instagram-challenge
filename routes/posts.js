const express = require("express");
const router = express.Router();

const PostsController = require("../controllers/posts");

router.get("/", PostsController.Index);
router.post("/", PostsController.Create);
router.get("/new", PostsController.New);
router.get("/:id", PostsController.PostInfo);
router.post("/:id", PostsController.Comment);
router.post("/:id/like", PostsController.Likes);
router.delete("/:id", PostsController.Delete);

module.exports = router;
