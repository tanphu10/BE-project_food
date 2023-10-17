import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model = initModels(sequelize);

const postOrder = async (req, res) => {
  let data = req.body;
  let { user_id, food_id } = data;
  let checkOrder = await model.orders.findOne({ where: { user_id, food_id } });
  // console.log("checkRate", checkRate);
  if (checkOrder) {
    await model.orders.update(data, { where: { user_id, food_id } });
    res.status(200).send("update successful order");
  } else {
    await model.orders.create(data);
    res.status(200).send("order successful");
  }
};

export { postOrder };
