const express = require("express");

const postsRouter = express.Router();
const PostsController = require("../controllers/posts");
const CommentsController = require("../controllers/comments");
const LikesController = require("../controllers/likes");

postsRouter.post("/:id/comment/new", CommentsController.NewComment);
postsRouter.post("/:id/like/new", LikesController.NewLike);
postsRouter.get("/:id", PostsController.Show);
postsRouter.get("/", PostsController.Index);
postsRouter.post("/new", PostsController.New);

module.exports = postsRouter;
