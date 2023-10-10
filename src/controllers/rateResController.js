import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js"
const model = initModels(sequelize);

const postRate = async (req, res) => {
  let data = req.body;
  console.log(req.body)
  console.log("data",data);
  await model.rate_res.create(data);
  // console.log("data", data);
  res.send("add successful")
  // e cung ko hieu bị hôm qua h ngồi mò quài không ra
};

const getListRate = async (req, res) => {
  let data = await model.rate_res.findAll({
    include: ["user"],
  });
  res.send(data);
};
export { postRate, getListRate };
