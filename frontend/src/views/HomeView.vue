
<template>
    <div class="home-container">
      <div class="hero">
        <h1>Bienvenue au Marché Frais !</h1>
        <p>Votre source N°1 pour des fruits frais, livrés directement chez vous.</p>
        <router-link to="/products" class="cta-button">Découvrir nos produits</router-link>
      </div>
    </div>
  </template>
  
  <style scoped>
  .home-container {
    text-align: center;
  }
  .hero {
    padding: 4rem 2rem;
    background-color: #f8f9fa;
    border-radius: 8px;
  }
  h1 {
    color: #28a745;
    margin-bottom: 1rem;
  }
  .cta-button {
    display: inline-block;
    margin-top: 1.5rem;
    padding: 0.8rem 1.6rem;
    background-color: #28a745;
    color: white;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    transition: background-color 0.3s;
  }
  .cta-button:hover {
    background-color: #218838;
  }
  </style>
  