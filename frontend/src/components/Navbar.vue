<script setup>
import { RouterLink } from 'vue-router'
</script>

<template>
  <nav class="navbar">
    <RouterLink to="/" class="brand">Le Marché Frais</RouterLink>
    <div class="nav-links">
      <RouterLink to="/">Accueil</RouterLink>
      <RouterLink to="/products">Produits</RouterLink>
      <RouterLink to="/login">Connexion</RouterLink>
    </div>
  </nav>
</template>

<style scoped>
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 2rem;
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}
.brand {
  font-weight: bold;
  font-size: 1.5rem;
  text-decoration: none;
  color: #28a745; /* Green color for freshness */
}
.nav-links a {
  margin: 0 1rem;
  text-decoration: none;
  color: #555;
  font-weight: 500;
}
</style>
