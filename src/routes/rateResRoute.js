import express from "express";
import { postRate, getListRate } from "../controllers/rateResController.js";

const rateResRoute = express.Router();

rateResRoute.post("/post-rate-res", postRate);











rateResRoute.get("/get-list-rate", getListRate);
export default rateResRoute;
