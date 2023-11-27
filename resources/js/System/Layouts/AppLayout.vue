<script setup>
import Header from '@/Admin/Partials/Navbar.vue'
import Sidebar from '@/Admin/Partials/Sidebar.vue'
import GuestSidebar from '@/Admin/Partials/GuestSidebar.vue'
import DefaultFooter from '@/Admin/Partials/Footer.vue'
import { ref,getCurrentInstance, onMounted } from 'vue'
import {useNotify} from "@/Composables/useNotify";

let {notification} = useNotify();
let isLoading = ref(false);
const context = getCurrentInstance().appContext.config.globalProperties;

context.$showLoading = () => {
    isLoading.value = true
}
context.$hideLoading = () => {
    isLoading.value = false
}

onMounted(() => {
    // notification('Test error message', 'error');

})
</script>

<template>
    <div id="app">
        <notifications />
        <loading v-model:active ="isLoading"
                 :can-cancel="false"
                 :is-full-page="fullPage"/>
        <div class="flex h-[100dvh] overflow-hidden">
            <Sidebar :sidebarOpen="sidebarOpen" @close-sidebar="sidebarOpen = false" />
            <div class="relative flex flex-col flex-1 overflow-y-auto overflow-x-hidden">
                <Header :sidebarOpen="sidebarOpen" @toggle-sidebar="sidebarOpen = !sidebarOpen" />

                <main class="grow">
                    <slot />
                </main>
            </div>
        </div>        
    </div>
</template>



