<template>
  <div>
    <!-- Campos de busca e filtro -->
    <div class="mt-4">
      <div class="d-flex align-items-center flex-wrap">
        <input
          v-model="searchQuery"
          type="text"
          class="form-control me-2"
          placeholder="Buscar"
        />
        <select v-model="selectedFilter" class="form-select me-2">
          <option value="">Todos</option>
          <option value="Nome">Nome</option>
          <option value="Codigo">Código</option>
          <option value="Cidade">Cidade</option>
        </select>
        <button @click="clearFilters" class="btn btn-outline-secondary">
          <i class="bi bi-x-circle"></i> Limpar Filtros
        </button>
      </div>
    </div>

    <!-- Tabela de clientes -->
    <div class="table-container">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Nome</th>
            <th>Código</th>
            <th>Cidade</th>
            <th class="text-end">Ações</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="client in filteredClients" :key="client.id">
            <td>{{ client.Nome }}</td>
            <td>{{ client.Codigo }}</td>
            <td>{{ client.Cidade }}</td>
            <td class="text-end">
              <button
                @click="editClient(client)"
                class="btn btn-warning btn-sm me-2"
              >
                <i class="bi bi-pencil"></i> Editar
              </button>
              <button
                @click="deleteClient(client.id)"
                class="btn btn-danger btn-sm"
              >
                <i class="bi bi-trash"></i> Excluir
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    clients: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {
      searchQuery: "",
      selectedFilter: "",
    };
  },
  computed: {
    filteredClients() {
      if (!this.searchQuery) return this.clients;

      if (this.selectedFilter === "") {
        return this.clients.filter((client) =>
          Object.values(client).some((value) =>
            String(value).toLowerCase().includes(this.searchQuery.toLowerCase())
          )
        );
      } else {
        return this.clients.filter((client) => {
          const value = client[this.selectedFilter] || "";
          return String(value)
            .toLowerCase()
            .includes(this.searchQuery.toLowerCase());
        });
      }
    },
  },
  methods: {
    editClient(client) {
      this.$emit("edit-client", client);
    },
    deleteClient(clientId) {
      try {
        this.$emit("delete-client", clientId);
      } catch (error) {
        console.error("Erro ao excluir cliente:", error);
      }
    },
    resetForm() {
      this.$emit("reset-form");
    },
    clearFilters() {
      this.searchQuery = "";
      this.selectedFilter = "";
    },
  },
};
</script>

<style scoped>
.table-container {
  max-height: 400px;
  overflow-y: auto;
  margin-top: 20px;
  border-radius: 10px;
  box-shadow: 2px 8px 9px rgba(8, 44, 82, 0.3);
}

.table {
  width: 100%;
}

.table th,
.table td {
  vertical-align: middle;
}

.table .btn {
  font-size: 0.875rem;
}

.d-flex .form-control,
.d-flex .form-select {
  flex: 1;
}

.d-flex .btn {
  flex-shrink: 0;
}
</style>
