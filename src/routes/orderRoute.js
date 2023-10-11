import express from "express";
import { postOrder } from "../controllers/orderController.js";

const orderRoute = express.Router();

orderRoute.post("/post-order", postOrder);

export default orderRoute;
