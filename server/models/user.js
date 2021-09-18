"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  User.init(
    {
      name: DataTypes.STRING,
      allowNull: false,
      email: DataTypes.STRING,
      allowNull: false,
      password: DataTypes.STRING,
      allowNull: false,
    },
    {
      sequelize,
      modelName: "User",
    }
  );

  User.associate = (models) => {
    User.hasMany(models.Photo, {
      foreignKey: "userId",
      as: "Photos",
    });
  };

  return User;
};
