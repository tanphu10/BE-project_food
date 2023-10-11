import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model = initModels(sequelize);

const postOrder = async (req, res) => {
  let data = req.body;
  await model.orders.create(data);
  res.send("order successful");
};

export { postOrder };
