import express from "express";
import { userSignUp,getUser } from "../controllers/userController.js";

const userRoute = express.Router();

// lấy danh sách theo by id
userRoute.get("/get-user/:id", getUser);

export default userRoute;
