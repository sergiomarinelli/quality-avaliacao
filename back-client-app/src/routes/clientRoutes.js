const express = require("express");
const router = express.Router();
const clientController = require("../controllers/clientController");

router.post("/clients", clientController.createClient);
router.get("/clients/:id", clientController.getClient);
router.put("/clients/:id", clientController.updateClient);
router.delete("/clients/:id", clientController.deleteClient);
router.get("/clients", clientController.getAllClients);
router.get("/clients/search", clientController.searchClients);

module.exports = router;
