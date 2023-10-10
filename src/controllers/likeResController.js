import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

let model = initModels(sequelize);

const getLikeRes = async (req, res) => {
  let data = await model.likes.findAll({
    include: ["user", "res"],
    // include: [],
  });
  res.send(data);
};
const postLike = async (req, res) => {
  let data = req.body;
  let { user_id, res_id } = data;
  let checkData = await model.likes.findOne({
    where: {
      user_id,
      res_id,
    },
  });
  if (checkData) {
    await model.likes.destroy({ where: { user_id, res_id } });
    res.status(200).send("dislike sucessful");
  } else {
    await model.likes.create(data);
    res.status(200).send("like sucessful");
  }
};
export { getLikeRes, postLike };
