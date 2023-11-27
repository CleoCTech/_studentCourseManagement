<template>
    <Head title="Home" />
    <header class="bg-white text-black sticky hrefp-0 z-50 w-full">
      <div class="container mx-auhref flex flex-wrap justify-between items-center px-4 py-4 sm:px-6 lg:px-8">
        <div class="flex items-center">
          <Link :href="route('home')" class="text-xl flex justify-between items-center gap-2 font-bold px-3 py-2 text-white border-4 border-primary capitalize sm:text-2xl">
            <img src="../../../../public/assets/images/logo.svg" alt="logo" />
            <span class="text-blue-600">Canva</span>
          </Link>
        </div>
  
        <nav class="hidden sm:flex items-center">
          <Link :href="route('home')" class="block p-4 text-blue-600 font-bold hover:text-primary">Home</Link>
          <Link :href="route('about')" class="block p-4 text-blue-600 font-bold hover:text-primary">About</Link>
          <Link :href="route('services')" class="block p-4 text-blue-600 font-bold hover:text-primary">Services</Link>
          <a href="https://blog.navjotsingh.uta.cloud/" class="block p-4 text-blue-600 font-bold hover:text-primary" target="_blank" rel="noreferrer">Blog</a>
          <Link :href="route('contact')" class="block p-4 text-blue-600 font-bold hover:text-primary">Contact</Link>
        </nav>
  
        <div class="flex items-center sm:hidden">
          <buthrefn @click="hrefggleNavigationDropdown" class="text-blue-600">
            <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
              <!-- ... menu icon ... -->
              <path
                v-show="!showingNavigationDropdown"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 6h16M4 12h16M4 18h16"
              />
              <path
                v-show="showingNavigationDropdown"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </buthrefn>
        </div>
  
        <!-- Mobile Dropdown -->
        <div class="sm:hidden" v-show="showingNavigationDropdown">
          <nav>
            <Link :href="route('home')" class="block p-4 text-blue-600 font-bold hover:text-primary">Home</Link>
            <Link :href="route('about')" class="block p-4 text-blue-600 font-bold hover:text-primary">About</Link>
            <Link :href="route('services')" class="block p-4 text-blue-600 font-bold hover:text-primary">Services</Link>
            <a href="https://blog.navjotsingh.uta.cloud/" class="block p-4 text-blue-600 font-bold hover:text-primary" target="_blank" rel="noreferrer">Blog</a>
            <Link :href="route('contact')" class="block p-4 text-blue-600 font-bold hover:text-primary">Contact</Link>
          </nav>
        </div>
  
        <div class="flex items-center">
          <template v-if="auth?.email">
            <div class="flex items-center gap-4">
              <Link v-if="$page.props.auth.user" :href="route('dashboard')" class="block px-8 py-2 rounded-sm text-blue-600 border capitalize font-bold hover:text-primary">
                Dashboard
              </Link>
              <Link :href="route('logout')" class="inline-block px-4 py-2 text-blue-600 capitalize font-bold hover:text-primary">
               Logout
              </Link>
            </div>
          </template>
          <template v-else>
            <Link href="/login" class="block px-8 py-2 rounded-sm text-blue-600 border font-bold hover:text-primary">Login</Link>
          </template>
        </div>
      </div>
    </header>
  </template>
  
  <script setup>
  import { ref } from 'vue';

  
  const showingNavigationDropdown = ref(false);
  
  const hrefggleNavigationDropdown = () => {
    showingNavigationDropdown.value = !showingNavigationDropdown.value;
  };

  </script>
  
  <!-- prop validation is not applicable in Vue 3, as props are declared in the `setup` function -->
  