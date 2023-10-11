import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

let model = initModels(sequelize);

const userSignUp = async (req, res) => {
  let data = await model.users.findAll();
  res.send(data);
};

const getUser = async (req, res) => {
  let { id } = req.params;
  console.log(id);
  let data = await model.users.findOne({
    where: { id },
    include: ["likes", "orders", "rate_res"],
  });
  res.send(data);
};
export { userSignUp, getUser };
