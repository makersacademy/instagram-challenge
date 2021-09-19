"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Photo extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Photo.init(
    {
      image: { type: DataTypes.STRING, allowNull: false },
      text: { type: DataTypes.STRING, allowNull: false },
    },
    {
      sequelize,
      modelName: "Photo",
    }
  );
  Photo.associate = (models) => {
    Photo.belongsTo(models.User, {
      foreignKey: { name: "userId", allowNull: false },
      onDelete: "CASCADE",
    });
  };
  return Photo;
};
