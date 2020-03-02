<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <Login />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Login from '@/components/Login.vue';

@Component({
  components: {
    Login,
  },
})
export default class App extends Vue {}
</script>

<style>
</style>
