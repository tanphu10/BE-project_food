import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
const model = initModels(sequelize);

const postRate = async (req, res) => {
  let data = req.body;
  let { user_id, res_id, amount } = data;
  let date_rate = new Date();
  let checkRate = await model.rate_res.findOne({ where: { user_id, res_id } });
  // console.log("checkRate", checkRate);
  if (checkRate) {
    await model.rate_res.update(
      { amount, date_rate },
      { where: { user_id, res_id } }
    );
    res.status(200).send("update successful");
  } else {
    // console.log({ user_id, res_id, amount, date_rate });
    await model.rate_res.create({ user_id, res_id, amount, date_rate });
    res.status(200).send("add successful");
  }
};
const getListRate = async (req, res) => {
  let data = await model.rate_res.findAll({
    include: ["user", "res"],
  });
  res.send(data);
};
export { postRate, getListRate };
