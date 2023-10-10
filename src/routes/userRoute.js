import express from "express";
import { userSignUp } from "../controllers/userController.js";

const userRoute = express.Router();

// đăng ký
userRoute.get("/get-All", userSignUp);

export default userRoute;
