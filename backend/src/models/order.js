
module.exports = (sequelize, DataTypes) => {
    const Order = sequelize.define('order', {
        userId: { type: DataTypes.INTEGER, allowNull: false, field: 'user_id' },
        productId: { type: DataTypes.INTEGER, allowNull: false, field: 'product_id' },
        quantity: { type: DataTypes.INTEGER, defaultValue: 1 },
        status: { type: DataTypes.STRING, defaultValue: 'pending' },
    }, {
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: false,
        tableName: 'orders'
    });
    return Order;
};
