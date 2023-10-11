import _sequelize from "sequelize";
const DataTypes = _sequelize.DataTypes;
import _food from  "./food.js";
import _food_type from  "./food_type.js";
import _likes from  "./likes.js";
import _orders from  "./orders.js";
import _rate_res from  "./rate_res.js";
import _res from  "./res.js";
import _users from  "./users.js";

export default function initModels(sequelize) {
  const food = _food.init(sequelize, DataTypes);
  const food_type = _food_type.init(sequelize, DataTypes);
  const likes = _likes.init(sequelize, DataTypes);
  const orders = _orders.init(sequelize, DataTypes);
  const rate_res = _rate_res.init(sequelize, DataTypes);
  const res = _res.init(sequelize, DataTypes);
  const users = _users.init(sequelize, DataTypes);

  res.belongsToMany(users, { as: 'user_id_users', through: likes, foreignKey: "res_id", otherKey: "user_id" });
  users.belongsToMany(res, { as: 'res_id_res', through: likes, foreignKey: "user_id", otherKey: "res_id" });
  orders.belongsTo(food, { as: "food", foreignKey: "food_id"});
  food.hasMany(orders, { as: "orders", foreignKey: "food_id"});
  food.belongsTo(food_type, { as: "type", foreignKey: "type_id"});
  food_type.hasMany(food, { as: "foods", foreignKey: "type_id"});
  likes.belongsTo(res, { as: "res", foreignKey: "res_id"});
  res.hasMany(likes, { as: "likes", foreignKey: "res_id"});
  rate_res.belongsTo(res, { as: "res", foreignKey: "res_id"});
  res.hasMany(rate_res, { as: "rate_res", foreignKey: "res_id"});
  likes.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(likes, { as: "likes", foreignKey: "user_id"});
  orders.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(orders, { as: "orders", foreignKey: "user_id"});
  rate_res.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(rate_res, { as: "rate_res", foreignKey: "user_id"});

  return {
    food,
    food_type,
    likes,
    orders,
    rate_res,
    res,
    users,
  };
}
