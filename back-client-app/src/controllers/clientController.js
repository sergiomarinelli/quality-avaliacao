const { Op } = require("sequelize");
const Client = require("../models/Client");

exports.createClient = async (req, res) => {
  console.log("Received request body:", req.body);
  try {
    const client = await Client.create(req.body);
    console.log("Client created:", client);
    res.status(201).json(client);
  } catch (error) {
    console.error("Error creating client:", error);
    res
      .status(500)
      .json({ message: "Error creating client", details: error.message });
  }
};

exports.getClient = async (req, res) => {
  try {
    const client = await Client.findByPk(req.params.id);
    if (client) {
      res.json(client);
    } else {
      res.status(404).json({ message: "Client not found" });
    }
  } catch (error) {
    console.error("Error retrieving client:", error);
    res
      .status(500)
      .json({ message: "Error retrieving client", details: error.message });
  }
};

exports.updateClient = async (req, res) => {
  try {
    const client = await Client.findByPk(req.params.id);
    if (client) {
      await client.update(req.body);
      res.json(client);
    } else {
      res.status(404).json({ message: "Client not found" });
    }
  } catch (error) {
    console.error("Error updating client:", error);
    res
      .status(500)
      .json({ message: "Error updating client", details: error.message });
  }
};

exports.deleteClient = async (req, res) => {
  try {
    const client = await Client.findByPk(req.params.id);
    if (client) {
      await client.destroy();
      res.status(204).send();
    } else {
      res.status(404).json({ message: "Client not found" });
    }
  } catch (error) {
    console.error("Error deleting client:", error);
    res
      .status(500)
      .json({ message: "Error deleting client", details: error.message });
  }
};

exports.getAllClients = async (req, res) => {
  try {
    const clients = await Client.findAll();
    res.json(clients);
  } catch (error) {
    console.error("Error retrieving clients:", error);
    res
      .status(500)
      .json({ message: "Error retrieving clients", details: error.message });
  }
};

exports.searchClients = async (req, res) => {
  try {
    const { Codigo, Nome, Cidade, CEP } = req.query;
    const where = {};
    if (Codigo) where.Codigo = Codigo;
    if (Nome) where.Nome = { [Op.like]: `%${Nome}%` };
    if (Cidade) where.Cidade = Cidade;
    if (CEP) where.CEP = CEP;

    const clients = await Client.findAll({ where });
    res.json(clients);
  } catch (error) {
    console.error("Error searching clients:", error);
    res
      .status(500)
      .json({ message: "Error searching clients", details: error.message });
  }
};
