
module.exports = (sequelize, DataTypes) => {
    const Product = sequelize.define('product', {
      name: { type: DataTypes.STRING, allowNull: false },
      description: { type: DataTypes.TEXT },
      price: { type: DataTypes.DECIMAL(10, 2) },
    }, { timestamps: false, tableName: 'products' });
    return Product;
  };