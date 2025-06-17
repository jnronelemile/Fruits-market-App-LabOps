
<!-- ------------------------------------ -->
<!-- src/views/LoginView.vue -->
<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import api from '../services/api';

const router = useRouter();
const isLogin = ref(true); // Toggle between Login and Register form

const email = ref('');
const password = ref('');
const errorMessage = ref('');
const successMessage = ref('');

async function handleSubmit() {
  errorMessage.value = '';
  successMessage.value = '';
  
  const endpoint = isLogin.value ? '/auth/login' : '/auth/register';
  
  try {
    const response = await api.post(endpoint, {
      email: email.value,
      password: password.value,
    });

    if (isLogin.value) {
      // On login, store token and redirect
      localStorage.setItem('token', response.data.token);
      router.push('/products');
    } else {
      // On register, show success message and switch to login
      successMessage.value = 'Inscription réussie ! Vous pouvez maintenant vous connecter.';
      isLogin.value = true;
      password.value = '';
    }

  } catch (error) {
    errorMessage.value = error.response?.data?.message || 'Une erreur est survenue.';
  }
}
</script>

<template>
  <div class="auth-container">
    <div class="auth-form">
      <h2>{{ isLogin ? 'Connexion' : 'Inscription' }}</h2>
      <form @submit.prevent="handleSubmit">
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" v-model="email" required>
        </div>
        <div class="form-group">
          <label for="password">Mot de passe</label>
          <input type="password" id="password" v-model="password" required>
        </div>

        <div v-if="errorMessage" class="error-box">{{ errorMessage }}</div>
        <div v-if="successMessage" class="success-box">{{ successMessage }}</div>

        <button type="submit" class="submit-btn">{{ isLogin ? 'Se connecter' : 'S\'inscrire' }}</button>
      </form>
      <p class="toggle-text">
        <a href="#" @click.prevent="isLogin = !isLogin">
          {{ isLogin ? 'Pas encore de compte ? S\'inscrire' : 'Déjà un compte ? Se connecter' }}
        </a>
      </p>
    </div>
  </div>
</template>

<style scoped>
.auth-container {
  display: flex;
  justify-content: center;
  align-items: center;
  padding-top: 2rem;
}
.auth-form {
  width: 100%;
  max-width: 400px;
  padding: 2rem;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}
.form-group {
  margin-bottom: 1.5rem;
}
label {
  display: block;
  margin-bottom: 0.5rem;
}
input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ccc;
  border-radius: 5px;
}
.submit-btn {
  width: 100%;
  padding: 0.75rem;
  border: none;
  background-color: #28a745;
  color: white;
  border-radius: 5px;
  font-size: 1rem;
  cursor: pointer;
}
.toggle-text {
  text-align: center;
  margin-top: 1rem;
}
.toggle-text a {
  color: #007BFF;
  text-decoration: none;
}
.error-box {
  background-color: #ffcccb;
  color: #a00;
  padding: 0.75rem;
  border-radius: 5px;
  margin-bottom: 1rem;
  text-align: center;
}
.success-box {
  background-color: #d4edda;
  color: #155724;
  padding: 0.75rem;
  border-radius: 5px;
  margin-bottom: 1rem;
  text-align: center;
}
</style>
