// quản lý các đối tượng endpoint
import express from "express";
import userRoute from "./userRoute.js";
import likeRoute from "./likeRoute.js";
import rateResRoute from "./rateResRoute.js";
import orderRoute from "./orderRoute.js";

const rootRoute = express.Router();

rootRoute.use("/user", userRoute);
rootRoute.use("/like", likeRoute);
rootRoute.use("/rate", rateResRoute);
rootRoute.use("/order", orderRoute);
export default rootRoute;
