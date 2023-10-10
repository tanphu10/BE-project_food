// quản lý các đối tượng endpoint
import express from "express";
import userRoute from "./userRoute.js";
import likeRoute from "./likeRoute.js";
import rateResRoute from "./rateResRoute.js";

const rootRoute = express.Router();

rootRoute.use("/user", userRoute);
rootRoute.use("/like", likeRoute);
rootRoute.use("/rate", rateResRoute);
export default rootRoute;
