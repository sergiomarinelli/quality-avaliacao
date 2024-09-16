const { DataTypes } = require("sequelize");
const sequelize = require("../database");

const Client = sequelize.define("Client", {
  id: {
    type: DataTypes.BIGINT,
    autoIncrement: true,
    primaryKey: true,
  },
  idUsuario: {
    type: DataTypes.BIGINT,
    allowNull: false,
  },
  DataHoraCadastro: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  Codigo: {
    type: DataTypes.STRING(15),
    allowNull: false,
  },
  Nome: {
    type: DataTypes.STRING(150),
    allowNull: false,
  },
  CPF_CNPJ: {
    type: DataTypes.STRING(20),
    allowNull: false,
  },
  CEP: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  Logradouro: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  Endereco: {
    type: DataTypes.STRING(120),
    allowNull: false,
  },
  Numero: {
    type: DataTypes.STRING(20),
    allowNull: false,
  },
  Bairro: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  Cidade: {
    type: DataTypes.STRING(60),
    allowNull: false,
  },
  UF: {
    type: DataTypes.STRING(2),
    allowNull: false,
  },
  Complemento: {
    type: DataTypes.STRING(150),
  },
  Fone: {
    type: DataTypes.STRING(15),
  },
  LimiteCredito: {
    type: DataTypes.FLOAT,
  },
  Validade: {
    type: DataTypes.DATE,
  },
});

module.exports = Client;
