<template>
  <SiteHeader />
  <div id="app">
    <div class="container my-5">
      <ClientForm
        :client="currentClient"
        :editMode="editMode"
        @create-client="createClient"
        @update-client="updateClient"
        @reset-form="resetForm"
      />
      <ClientList
        :clients="clients"
        @edit-client="editClient"
        @delete-client="deleteClient"
      />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";
import ClientForm from "./components/ClientForm.vue";
import ClientList from "./components/ClientList.vue";
import SiteHeader from "./components/SiteHeader.vue";

export default {
  components: {
    ClientForm,
    ClientList,
    SiteHeader,
  },
  data() {
    return {
      clients: [],
      currentClient: {
        Codigo: "",
        Nome: "",
        CPF_CNPJ: "",
        CEP: "",
        Logradouro: "",
        Numero: "",
        Bairro: "",
        Cidade: "",
        UF: "",
        Endereco: "",
        Complemento: "",
        Fone: "",
        LimiteCredito: 0,
        Validade: "",
        idUsuario: null,
      },
      editMode: false,
      apiUrl: process.env.VUE_APP_API_URL,
    };
  },
  methods: {
    async fetchClients() {
      try {
        const response = await axios.get(`${this.apiUrl}/clients`);
        this.clients = response.data;
      } catch (error) {
        console.error("Erro ao buscar clientes:", error);
        this.showErrorAlert("Erro ao buscar clientes", error);
      }
    },
    async createClient(client) {
      try {
        await axios.post(`${this.apiUrl}/clients`, client);
        await this.fetchClients();
        this.showSuccessAlert("Cliente criado com sucesso!");
      } catch (error) {
        console.error("Erro ao criar cliente:", error);
        this.showErrorAlert("Erro ao criar cliente", error);
      }
    },
    async updateClient(client) {
      try {
        await axios.put(`${this.apiUrl}/clients/${client.id}`, client);
        await this.fetchClients();
        this.showSuccessAlert("Cliente atualizado com sucesso!");
      } catch (error) {
        console.error("Erro ao atualizar cliente:", error);
        this.showErrorAlert("Erro ao atualizar cliente", error);
      }
    },
    editClient(client) {
      this.currentClient = { ...client };
      this.editMode = true;
    },
    async deleteClient(clientId) {
      try {
        await axios.delete(`${this.apiUrl}/clients/${clientId}`);
        await this.fetchClients();
        this.showSuccessAlert("Cliente excluído com sucesso!");
      } catch (error) {
        console.error("Erro ao excluir cliente:", error);
        this.showErrorAlert("Erro ao excluir cliente", error);
      }
    },
    resetForm() {
      this.currentClient = {
        Codigo: "",
        Nome: "",
        CPF_CNPJ: "",
        CEP: "",
        Logradouro: "",
        Numero: "",
        Bairro: "",
        Cidade: "",
        UF: "",
        Endereco: "",
        Complemento: "",
        Fone: "",
        LimiteCredito: 0,
        Validade: "",
        idUsuario: null,
      };
      this.editMode = false;
    },
    showSuccessAlert(message) {
      Swal.fire({
        icon: "success",
        title: "Sucesso!",
        text: message,
        timer: 3000,
        showConfirmButton: false,
      });
    },
    showErrorAlert(title, error) {
      Swal.fire({
        icon: "error",
        title: title,
        text: error.response ? error.response.data.message : error.message,
        timer: 3000,
        showConfirmButton: false,
      });
    },
  },
  mounted() {
    this.fetchClients();
  },
};
</script>

<style>
.container {
  position: relative;
  max-width: 800px;
  margin: 0 auto;
}

.form-container {
  border: 1px solid #ddd;
  padding: 20px;
  border-radius: 8px;
  background-color: #f9f9f9;
}

.client-list {
  margin-top: 30px;
}

.list-group-item {
  border-radius: 8px;
  border: 1px solid #ddd;
  margin-bottom: 10px;
  padding: 15px;
  background-color: #fff;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.list-group-item .btn {
  margin-left: 5px;
}

::-webkit-scrollbar {
  width: 6px;
}

::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 5px;
}

::-webkit-scrollbar-thumb {
  background: #364660;
  border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
  background: #555;
}

.scroll-container {
  scrollbar-width: thin;
  scrollbar-color: #888 #f1f1f1;
}

.scroll-container::-webkit-scrollbar {
  border-radius: 4px;
}
</style>
