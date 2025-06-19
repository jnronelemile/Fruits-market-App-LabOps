
<script setup>
import { RouterView } from 'vue-router'
import Navbar from './components/Navbar.vue'
</script>

<template>
  <div id="app-container">
    <Navbar />
    <main class="main-content">
      <RouterView />
    </main>
    <footer class="footer">
      <p>&copy; 2025 Le Marché Frais. Votre dose quotidienne de vitamines.</p>
    </footer>
  </div>
</template>

<style scoped>
#app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
}
.main-content {
  flex: 1;
  padding: 1rem 2rem;
}
.footer {
  text-align: center;
  padding: 1rem;
  background-color: #f4f4f4;
  font-size: 0.9em;
  color: #666;
  border-top: 1px solid #ddd;
}
</style>
