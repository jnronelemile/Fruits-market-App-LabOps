
module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('user', {
      email: { type: DataTypes.STRING, unique: true, allowNull: false },
      password: { type: DataTypes.STRING, allowNull: false },
    }, { timestamps: false, tableName: 'users' });
    return User;
  };
  