
<script setup>
import { ref, onMounted } from 'vue';
import api from '../services/api';

const products = ref([]);
const error = ref(null);

onMounted(async () => {
  try {
    const response = await api.get('/products');
    products.value = response.data;
  } catch (err) {
    error.value = 'Impossible de charger les produits. Le backend est-il en cours d\'exécution ?';
    console.error(err);
  }
});
</script>

<template>
  <div v-if="error" class="error-box">{{ error }}</div>
  <div class="product-grid" v-else>
    <div v-for="product in products" :key="product.id" class="product-card">
      <h3>{{ product.name }}</h3>
      <p>{{ product.description }}</p>
      <div class="price">{{ product.price }} €</div>
      <button class="buy-button">Ajouter au panier</button>
    </div>
  </div>
</template>

<style scoped>
.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1.5rem;
  margin-top: 2rem;
}
.product-card {
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  display: flex;
  flex-direction: column;
}
.product-card h3 {
  margin-top: 0;
  color: #333;
}
.product-card .price {
  margin-top: auto;
  font-weight: bold;
  font-size: 1.2rem;
  color: #28a745;
}
.buy-button {
  margin-top: 1rem;
  padding: 0.75rem 1rem;
  border: none;
  background-color: #28a745; /* Green button */
  color: white;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
}
.error-box {
    margin-top: 2rem;
    padding: 1rem;
    background-color: #ffcccb;
    border: 1px solid #ff0000;
    border-radius: 5px;
    color: #a00;
}
</style>
