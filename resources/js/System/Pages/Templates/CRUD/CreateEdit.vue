<template>
    <div>
        <x-menu-bar v-bind="{setup,selected}" @onAttachments="handleAttachments" class="w-full"></x-menu-bar>
        <div class="px-4 sm:px-6 lg:px-8 py-8 w-full max-w-9xl mx-auto flex">
    <!-- Left Column -->
    <div class="flex-grow">
        <div class="mb-8">
            <h1 class="text-2xl md:text-3xl text-slate-800 dark:text-slate-100 font-bold">{{setup.pageTitle}}</h1>
        </div>

        <x-panel>
            <template #title>{{setup.pageTitle}}</template>
            <template #body>
                <slot></slot>
                <!-- <x-attachment v-if="isAttachments && setup.pageType == 'edit'" class="flex-none pr-2 md:max-w-xs" :setup="setup" :selected="selected"/> -->
            </template>
        </x-panel>

        <div class="mb-8 border-t border-slate-200 dark:border-slate-700">
            <h1 class="text-2xl md:text-3xl text-slate-800 dark:text-slate-100 font-bold mt-5">Lines</h1>
        </div>
        <div class="border-t border-slate-200 dark:border-slate-700"></div>
        <!-- <ListPart :setup="setup" :listData="lines" :selected="selected" :listPageTitle="listPageTitle" ></ListPart> -->
    </div>

    <!-- Right Column (x-attachment) -->
    <div class="flex-none">
        <x-attachment v-if="isAttachments && setup.pageType == 'edit'" class="pr-2 md:max-w-xs" :setup="setup" :selected="selected"/>
    </div>
</div>

    </div>
</template>
<script setup>
    import xPanel from '@/Components/Panel.vue'
    import xButton from '@/Components/Button.vue'
    import xMenuBar from '@/Components/MenuBar.vue'
    import xAttachment from '@/Components/Attachment.vue'
    import ListPart from '@/System/Pages/Templates/CRUD/ListPart.vue'

    import {onMounted, ref } from 'vue';
    
    const props = defineProps({
        setup: Object,
        lines: Object,
        listPageTitle: String,
        selected: {
            type: Array,
            default: null,
        },
    });

    const isAttachments = ref(false);

    onMounted(() => {
        // console.log(props.selected);
        if (props.selected) {
            isAttachments.value = true;
        }
    })

    const handleAttachments = (message) => {
        console.log(message);
        isAttachments.value = message;
        // Your logic here
    }
    
</script>
