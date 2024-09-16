<template>
  <header class="site-header">
    <h1>QualityClientes</h1>
  </header>
</template>

<script>
export default {
  name: "SiteHeader",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap");

.site-header {
  background-color: #2c3e50;
  color: #ecf0f1;
  padding: 10px 20px;
  text-align: left;
  border-bottom: 4px solid #34495e;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  font-family: "Montserrat", sans-serif;
}

.site-header h1 {
  margin: 0;
  font-size: 1rem;
  font-weight: 600;
  letter-spacing: 1px;
}
</style>
