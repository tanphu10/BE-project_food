import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

let model = initModels(sequelize);

// yarn add bcrypt

const userSignUp = async (req, res) => {
  let data = await model.users.findAll();
  res.send(data);
};

export { userSignUp };
