import './bootstrap';
import '../css/app.css';
import '../css/ck-editor.css';
import '../css/style.css'

import { createApp, h } from 'vue';
import { createInertiaApp, Head, Link } from '@inertiajs/vue3';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';
import { ZiggyVue } from '../../vendor/tightenco/ziggy/dist/vue.m';

// import { InertiaProgress } from '@inertiajs/progress';

// const appName = import.meta.env.VITE_APP_NAME || 'Laravel';

import { createPinia } from 'pinia';
// import VueSocialSharing from 'vue-social-sharing'
import 'gitart-vue-dialog/dist/style.css'
import { GDialog } from 'gitart-vue-dialog'
import { plugin as dialogPlugin } from 'gitart-vue-dialog'

import Notifications from '@kyvg/vue3-notification'
import VueLoading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/css/index.css';

import { Icon } from '@iconify/vue';

import GuestLayout from '@/Guest/Layouts/Default.vue'
import GuestBlankLayout from '@/Guest/Layouts/Blank.vue'
import SystemLayout from '@/System/Layouts/AppLayout.vue'

const appName = window.document.getElementsByTagName('title')[0]?.innerText || 'Laravel';
const resolvePage = (name) => {
    return resolvePageComponent(`./${name}.vue`, import.meta.glob("./**/*.vue"));
};


createInertiaApp({
// ... other options ...
title: (title) => `${title} - ${appName}`,
resolve: async (name) => {
    if (name.startsWith('Guest/')) {
        const page = await resolvePage(name);
        if (!page) {
            console.error(`Page component '${name}' not found.`);
            return;
        }

        const module = await page;

        if (!module || !module.default) {
            console.error(`Module or module.default is undefined for page '${name}'.`);
            return;
        }

        if (name.startsWith('Guest/Auth/')) {
            if (name === 'Guest/Auth/Login') {
                module.default.layout = GuestBlankLayout;
            } else if (name === 'Guest/Auth/ResetPassword') {
                module.default.layout = GuestBlankLayout;
            } else if (name === 'Guest/Auth/VerifyEmail') {
                module.default.layout = GuestBlankLayout;
            }else if (name === 'Guest/Auth/ForgotPassword') {
                module.default.layout = GuestBlankLayout;
            } else if (name === 'Guest/Auth/ConfirmPassword') {
                module.default.layout = GuestBlankLayout;
            }
            else {
                module.default.layout = GuestBlankLayout;
            }
        } else {
            module.default.layout = GuestBlankLayout;
        }
    } else if (name.startsWith('Admin/') || name.startsWith('System/') || name.startsWith('Auth/')) {
        const page = await resolvePage(name);

        if (!page) {
            console.error(`Page component '${name}' not found.`);
            return;
        }

        const module = await page;

        if (!module || !module.default) {
            console.error(`Module or module.default is undefined for page '${name}'.`);
            return;
        }

        module.default.layout = SystemLayout;
    } else if(name.startsWith('Pages/Auth/')) {
        console.log('Pages/Auth/');
        const page = await resolvePage(name);

        if (!page) {
            console.error(`Page component '${name}' not found.`);
            return;
        }

        const module = await page;

        if (!module || !module.default) {
            console.error(`Module or module.default is undefined for page '${name}'.`);
            return;
        }
        module.default.layout = GuestBlankLayout;
    } else if(name.startsWith('Auth/')) {
        console.log('Auth/');
        const page = await resolvePage(name);

        if (!page) {
            console.error(`Page component '${name}' not found.`);
            return;
        }

        const module = await page;

        if (!module || !module.default) {
            console.error(`Module or module.default is undefined for page '${name}'.`);
            return;
        }
        module.default.layout = GuestBlankLayout;
    } else {
        console.log('else');
    }

    return resolvePage(name);
},

setup({ el, App, props, plugin }) {
        return createApp({ render: () => h(App, props) })
            .use(plugin)
            .use(ZiggyVue, Ziggy)
            .use(VueLoading)
            .use(Notifications)
            .component('loading',VueLoading)
            .component('Head',Head)
            .component('Link',Link)
            .component('GDialog', GDialog)
            .component('Icon', Icon)
            .use(createPinia())
            .use(dialogPlugin)
            .mount(el);
    },
    progress: {
        color: '#4B5563',
    },

// ... other options ...
});

