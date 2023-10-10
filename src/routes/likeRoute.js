import express from "express";
import { getLikeRes, postLike } from "../controllers/likeResController.js";

const likeRoute = express.Router();

// like nhà hàng l
likeRoute.get("/get-all-like", getLikeRes);
likeRoute.post("/post-like", postLike);
export default likeRoute;
