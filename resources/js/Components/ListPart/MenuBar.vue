<template>
    <div>
        <div class="relative mb-8">
            <div class="absolute bottom-0 w-full h-px bg-slate-200 dark:bg-slate-700" aria-hidden="true"></div>
            <ul id="tabs" class="relative text-sm font-medium flex flex-nowrap -mx-4 sm:-mx-6 lg:-mx-8 overflow-x-scroll no-scrollbar">
                <li @click="activeTab('home')" class="mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                    <a href="#" 
                    class="block pb-3 whitespace-nowrap " 
                    :class="active == 'home'? 
                    'text-indigo-500 border-b-2 border-indigo-500' :
                    'text-slate-500 dark:text-slate-400 hover:text-slate-600 dark:hover:text-slate-300'" >Home
                    </a>
                </li>
                <li @click="activeTab('moreActions')" class="mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                    <a href="#" 
                    class="block pb-3 whitespace-nowrap " 
                    :class="active == 'moreActions'? 
                    'text-indigo-500 border-b-2 border-indigo-500' :
                    'text-slate-500 dark:text-slate-400 hover:text-slate-600 dark:hover:text-slate-300'" >More Actions
                    </a>
                </li>
                <li @click="activeTab('reports')" class="mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                    <a href="#" 
                    class="block pb-3 whitespace-nowrap " 
                    :class="active == 'reports'? 
                    'text-indigo-500 border-b-2 border-indigo-500' :
                    'text-slate-500 dark:text-slate-400 hover:text-slate-600 dark:hover:text-slate-300'" >Reports
                    </a>
                </li>
                <li class="mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                    <a href="#" 
                    class="block pb-3 whitespace-nowrap " 
                    :class="active == 'charts'? 
                    'text-indigo-500 border-b-2 border-indigo-500' :
                    'text-slate-500 dark:text-slate-400 hover:text-slate-600 dark:hover:text-slate-300'" >Charts
                    </a>
                </li>
            </ul>
            <div class="flexx flex-rowx pr-4 pl-1 pt-2">
                    <div v-if="active == 'home'" class="">
                        <x-standard-actions v-bind="{setup,selected}"
                            @onMultipleSelect="isMultipleSelect = !isMultipleSelect"
                            @onAttachments="$parent.isAttachments = !$parent.isAttachments"
                            @onFilter="onFilter"
                            @onExport="onExport"
                            @showCreateEditPanel="showCreateEditPanel"
                        />
                    </div>
                    <!-- <div v-if="active == 'moreActions'">
                        <em v-if="this.setup.settings.isMoreActions == false" class="text-blue-500">No more actions found</em>
                        <component v-if="this.setup.settings.isMoreActions != false && this.setup.settings.xMoreActions != null" :is="dynamicComponent" :selected="selected"></component>
                    </div>
                    <div v-if="active == 'reports'">
                        <em v-if="this.setup.settings.isReports == false"  class="text-blue-500">No reports found</em>
                        <component v-if="this.setup.settings.isReports != false" :is="dynamicComponent" :indexRoute="this.setup.settings.indexRoute" ></component>
                    </div>
                    <div v-if="active == 'charts'">
                        <em v-if="this.setup.settings.isCharts == false"  class="text-blue-500">No charts found</em>
                        <component v-if="this.setup.settings.isCharts != false" :is="dynamicComponent" :indexRoute="this.setup.settings.indexRoute" ></component>
                    </div> -->
                </div>
        </div>
    </div>
</template>

<script setup>
import xStandardActions from '@/Components/ListPart/StandardActions.vue'
import { ref, inject, defineEmits } from 'vue';

const props = defineProps({
    setup:Object,
    selected:{default:[]},
})

const isMultipleSelect = inject('isMultipleSelect');

const active = ref('home') 
const dynamicComponent = ref({default:''})

const emits = defineEmits(['showCreateEditPanel']);  
const showCreateEditPanel = (value) => {
    emits('showCreateEditPanel', value);
};
</script>

<style scoped>

</style>