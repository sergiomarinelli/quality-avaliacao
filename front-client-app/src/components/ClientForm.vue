<template>
  <div class="container my-2">
    <form @submit.prevent="submitForm" class="form-container row g-2">
      <h1 class="m-0 title text-center">
        {{ editMode ? "Editar Cliente" : "Cadastro de Cliente" }}
      </h1>
      <div class="col-md-3 mb-2">
        <FormField
          v-model="localClient.Codigo"
          id="Codigo"
          label="Código"
          required
        />
      </div>
      <div class="col-md-3 mb-2">
        <FormField v-model="localClient.Nome" id="Nome" label="Nome" required />
      </div>
      <div class="col-md-3 mb-2">
        <FormField
          v-model="localClient.CPF_CNPJ"
          id="CPF_CNPJ"
          label="CPF/CNPJ"
          required
        />
      </div>
      <div class="col-md-3 mb-2">
        <FormField
          v-model="localClient.CEP"
          id="CEP"
          label="CEP"
          @blur="fetchAddress"
          required
        />
      </div>
      <div class="col-md-4 mb-2">
        <FormField
          v-model="localClient.Logradouro"
          id="Logradouro"
          label="Logradouro"
          required
        />
      </div>
      <div class="col-md-2 mb-2">
        <FormField
          v-model="localClient.Numero"
          id="Numero"
          label="Número"
          required
        />
      </div>
      <div class="col-md-3 mb-2">
        <FormField
          v-model="localClient.Bairro"
          id="Bairro"
          label="Bairro"
          required
        />
      </div>
      <div class="col-md-3 mb-2">
        <FormField
          v-model="localClient.Cidade"
          id="Cidade"
          label="Cidade"
          required
        />
      </div>
      <div class="col-md-2 mb-2">
        <FormField v-model="localClient.UF" id="UF" label="UF" required />
      </div>
      <div class="col-md-4 mb-2">
        <FormField
          v-model="localClient.Endereco"
          id="Endereco"
          label="Endereço"
          required
        />
      </div>
      <div class="col-md-4 mb-2">
        <FormField
          v-model="localClient.Complemento"
          id="Complemento"
          label="Complemento"
        />
      </div>
      <div class="col-md-4 mb-2">
        <FormField v-model="localClient.Fone" id="Fone" label="Telefone" />
      </div>
      <div class="col-md-4 mb-2">
        <FormField
          v-model="localClient.LimiteCredito"
          id="LimiteCredito"
          label="Limite de Crédito"
        />
      </div>
      <div class="col-md-4 mb-2">
        <FormField
          v-model="formattedValidade"
          id="Validade"
          label="Validade"
          type="date"
          required
        />
      </div>
      <div class="col-md-4 mb-2">
        <FormField
          v-model="localClient.idUsuario"
          id="idUsuario"
          label="ID Usuário"
          type="number"
          required
        />
      </div>
      <div class="col-8 d-flex justify-content-end mt-2">
        <button
          type="submit"
          style="max-height: 50px"
          class="btn btn-primary me-2"
        >
          {{ editMode ? "Atualizar" : "Salvar" }}
        </button>
        <button
          v-if="editMode"
          @click="resetForm"
          style="max-height: 50px"
          class="btn btn-secondary"
        >
          Cancelar
        </button>
      </div>
    </form>
  </div>
</template>

<script>
import FormField from "./FormField.vue";
import axios from "axios";

export default {
  components: { FormField },
  props: {
    client: {
      type: Object,
      default: () => ({}),
    },
    editMode: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      localClient: { ...this.client },
      isAlertVisible: false,
      alertType: "",
      alertMessage: "",
    };
  },
  computed: {
    formattedValidade: {
      get() {
        return this.formatDate(this.localClient.Validade);
      },
      set(value) {
        this.localClient.Validade = this.parseDate(value);
      },
    },
  },
  watch: {
    client: {
      handler(newClient) {
        this.localClient = { ...newClient };
      },
      deep: true,
    },
  },
  methods: {
    formatDate(date) {
      if (!date) return "";

      const dateObj = new Date(date);
      if (isNaN(dateObj.getTime())) {
        console.warn("Data inválida:", date);
        return "";
      }

      return dateObj.toISOString().split("T")[0];
    },
    parseDate(dateStr) {
      if (!dateStr) return "";

      const dateObj = new Date(dateStr);
      if (isNaN(dateObj.getTime())) {
        console.warn("Data inválida:", dateStr);
        return "";
      }

      return dateObj.toISOString();
    },
    async fetchAddress() {
      console.log(this.localClient.CEP);
      const cep = this.localClient.CEP.replace("-", "");
      if (cep.length === 8) {
        try {
          const response = await axios.get(
            `https://viacep.com.br/ws/${cep}/json/`
          );
          const { logradouro, bairro, localidade, uf } = response.data;
          this.localClient.Logradouro = logradouro;
          this.localClient.Bairro = bairro;
          this.localClient.Cidade = localidade;
          this.localClient.UF = uf;
        } catch (error) {
          console.error("Erro ao buscar endereço:", error);
        }
      }
    },
    async submitForm() {
      try {
        const clientToSubmit = { ...this.localClient };
        clientToSubmit.Validade = this.parseDate(clientToSubmit.Validade);

        if (this.editMode) {
          await this.$emit("update-client", clientToSubmit);
        } else {
          await this.$emit("create-client", clientToSubmit);
        }
        this.$emit("reset-form");
      } catch (error) {
        console.error("Erro ao salvar cliente:", error);
      }
    },
    resetForm() {
      this.$emit("reset-form");
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap");

.form-container {
  border: 1px solid #ddd;
  padding: 15px;
  border-radius: 8px;
  background-color: #ffffff;
  box-shadow: 1px 4px 6px rgba(8, 44, 82, 0.2);
  font-family: "Roboto", sans-serif;
}

.form-container h1 {
  font-size: 1.5rem; /* Tamanho reduzido do título */
  font-weight: 500;
  color: #333;
  margin-bottom: 0.75rem; /* Menos margem abaixo do título */
}

input,
select,
textarea {
  font-family: "Roboto", sans-serif;
  font-size: 0.875rem;
  padding: 0px 8px; /* Reduzido para economizar espaço */
  border-radius: 4px;
  border: 1px solid #ccc;
}

button {
  font-family: "Roboto", sans-serif;
  font-size: 0.875rem;
  padding: 8px 16px; /* Ajustado para um tamanho menor */
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.btn-primary {
  background-color: #007bff;
  color: #ffffff;
}

.btn-secondary {
  background-color: #6c757d;
  color: #ffffff;
}

.btn-primary:hover {
  background-color: #0056b3;
}

.btn-secondary:hover {
  background-color: #5a6268;
}

.title {
  font-size: 1.75rem; /* Tamanho reduzido do título */
}
</style>
