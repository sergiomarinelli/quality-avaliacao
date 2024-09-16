<template>
  <div class="form-group">
    <div class="input-wrapper">
      <input
        :value="formattedValue"
        :type="type"
        :id="id"
        class="form-control"
        :required="required"
        @input="updateValue"
        @focus="isFocused = true"
        @blur="$emit('blur'), (isFocused = false)"
      />
      <label :for="id" :class="{ float: isFocused || modelValue }">{{
        label
      }}</label>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    modelValue: {
      type: [String, Number],
      default: "",
    },
    label: {
      type: String,
      required: true,
    },
    id: {
      type: String,
      required: true,
    },
    type: {
      type: String,
      default: "text",
    },
    required: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      rawValue: String(this.modelValue),
      isFocused: false,
    };
  },
  computed: {
    formattedValue() {
      if (this.type === "date") {
        return this.formatDate(this.rawValue);
      }

      switch (this.id) {
        case "CEP":
          return this.applyCepMask(this.rawValue);
        case "Fone":
          return this.applyPhoneMask(this.rawValue);
        case "LimiteCredito":
          return this.applyCurrencyMask(this.rawValue);
        case "CPF_CNPJ":
          return this.applyCPFCNPJMask(this.rawValue);
        default:
          return this.rawValue;
      }
    },
  },
  methods: {
    updateValue(event) {
      const value = event.target.value;

      if (this.type === "date") {
        this.$emit("update:modelValue", value);
      } else {
        this.rawValue = this.cleanValue(value);
        this.$emit("update:modelValue", this.rawValue);
      }
    },
    formatDate(value) {
      if (value && value.length >= 10) {
        return value.slice(0, 10);
      }
      return value;
    },
    cleanValue(value) {
      if (
        this.id === "CEP" ||
        this.id === "Fone" ||
        this.id === "LimiteCredito" ||
        this.id === "CPF_CNPJ"
      ) {
        return value.replace(/\D/g, "");
      }
      return value;
    },
    applyCepMask(value) {
      if (typeof value !== "string") {
        value = String(value || "");
      }
      return value.replace(/^(\d{5})(\d{3})$/, "$1-$2");
    },
    applyPhoneMask(value) {
      if (typeof value !== "string") {
        value = String(value || "");
      }
      return value.replace(/^(\d{2})(\d{4,5})(\d{4})$/, "($1) $2-$3");
    },
    applyCurrencyMask(value) {
      if (typeof value !== "string") {
        value = String(value || "");
      }

      const numericValue = value.replace(/\D/g, "");

      const integerPart = numericValue.slice(0, -2);
      const decimalPart = numericValue.slice(-2);

      const formattedValue = `${integerPart}.${decimalPart}`;

      const numberValue = parseFloat(formattedValue) || 0;
      const currencyValue = numberValue.toFixed(2);

      return `R$ ${currencyValue
        .replace(".", ",")
        .replace(/\B(?=(\d{3})+(?!\d))/g, ".")}`;
    },
    applyCPFCNPJMask(value) {
      if (typeof value !== "string") {
        value = String(value || "");
      }

      const cleanValue = value.replace(/\D/g, "");

      if (cleanValue.length <= 11) {
        // CPF
        return cleanValue.replace(
          /(\d{3})(\d{3})?(\d{3})?(\d{2})?/,
          (match, p1, p2, p3, p4) => {
            return `${p1}${p2 ? "." + p2 : ""}${p3 ? "." + p3 : ""}${
              p4 ? "-" + p4 : ""
            }`;
          }
        );
      } else {
        // CNPJ
        return cleanValue.replace(
          /(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/,
          (match, p1, p2, p3, p4, p5) => {
            return `${p1}.${p2}.${p3}/${p4}-${p5}`;
          }
        );
      }
    },
  },
  watch: {
    modelValue(newVal) {
      this.rawValue = String(newVal);
    },
  },
};
</script>

<style scoped>
.form-group {
  position: relative;
  margin-bottom: 1rem;
}

.input-wrapper {
  position: relative;
}

.input-wrapper .form-control {
  width: 100%;
  padding: 0.75rem 0.75rem;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  box-sizing: border-box;
  font-size: 1rem;
}

.input-wrapper label {
  position: absolute;
  top: 0.75rem;
  left: 0.75rem;
  font-size: 1rem;
  color: #6c757d;
  transition: all 0.2s ease-out;
  background-color: #fff;
  padding: 0 0.25rem;
}

.input-wrapper label.float {
  top: -0.5rem;
  left: 0.75rem;
  font-size: 0.75rem;
  color: #007bff;
}
</style>
