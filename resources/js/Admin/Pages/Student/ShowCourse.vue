<template>
   <Head :title="course.code" />

   <div class="px-4 sm:px-6 lg:px-8 py-8 w-full max-w-9xl mx-auto">
        <!-- Page content -->
        <div class="max-w-5xl mx-auto flex flex-col lg:flex-row lg:space-x-8 xl:space-x-16">

<!-- Content -->
<div>
  <div class="mb-6">
    <Link class="btn-sm px-3 bg-white dark:bg-slate-800 border-slate-200 dark:border-slate-700 hover:border-slate-300 dark:hover:border-slate-600 text-slate-600 dark:text-slate-300" :href="route('student.dashboard')">
      <svg class="fill-current text-slate-400 dark:text-slate-500 mr-2" width="7" height="12" viewBox="0 0 7 12">
        <path d="M5.4.6 6.8 2l-4 4 4 4-1.4 1.4L0 6z" />
      </svg>
      <span>Back To Dashboard</span>
    </Link>
  </div>
  <div class="text-sm text-slate-500 dark:text-slate-400 italic mb-2">Created {{course.created_at}}</div>
  <header class="mb-4">
    <!-- Title -->
    <h1 class="text-2xl md:text-3xl text-slate-800 dark:text-slate-100 font-bold">{{course.title}}</h1>
  </header>

  <!-- Company information (mobile) -->
  <!-- <div class="bg-white dark:bg-slate-800 p-5 shadow-lg rounded-sm border border-slate-200 dark:border-slate-700 mb-6 lg:hidden">
    <div class="text-center mb-6">
      <div class="inline-flex mb-3">
        <img class="w-16 h-16 rounded-full" src="../../images/company-icon-01.svg" width="64" height="64" alt="Company 01" />
      </div>
      <div class="text-lg font-bold text-slate-800 dark:text-slate-100 mb-1">Revolut Ltd</div>
      <div class="text-sm text-slate-500 dark:text-slate-400 italic">179 Jobs Posted</div>
    </div>
    <div class="space-y-2 sm:flex sm:space-y-0 sm:space-x-2">
      <button class="btn w-full bg-indigo-500 hover:bg-indigo-600 text-white">Apply Today -&gt;</button>
      <button class="btn w-full dark:bg-slate-800 border-slate-200 dark:border-slate-700 hover:border-slate-300 dark:hover:border-slate-600 text-slate-600 dark:text-slate-300">Company Profile</button>
    </div>
  </div> -->

  <!-- Tags -->
  <div class="mb-6">
    <div class="flex flex-wrap items-center -m-1">
      <div class="m-1">
        <a class="text-xs inline-flex font-medium bg-indigo-100 dark:bg-indigo-500/30 text-indigo-600 dark:text-indigo-400 rounded-full text-center px-2.5 py-1" href="#0">{{course.program.name}}</a>
      </div>
      
    </div>
  </div>

  <hr class="my-6 border-t border-slate-200 dark:border-slate-700" />

  <!-- The Role -->
  <div v-html="course.description">
  </div>

  

  <hr class="my-6 border-t border-slate-200 dark:border-slate-700" />

  <!-- Related Jobs -->
  <div>
    <h2 class="text-slate-800 dark:text-slate-100 font-semibold mb-2">Course Materials</h2>
    <div class="bg-white dark:bg-slate-800 p-4 border border-slate-200 dark:border-slate-700 rounded-sm shadow-sm">
        <ul class="space-y-3">

        <!-- Item -->
        <li v-for="(record,index) in attachments" v-bind:key="index"  class="sm:flex sm:items-center sm:justify-between">
            <div class="sm:grow flex items-center text-sm">
            <!-- Icon -->
            <div class="w-8 h-8 rounded-full shrink-0 bg-amber-500 my-2 mr-3">
                <svg class="w-8 h-8 fill-current text-amber-50" viewBox="0 0 32 32">
                <path d="M21 14a.75.75 0 0 1-.75-.75 1.5 1.5 0 0 0-1.5-1.5.75.75 0 1 1 0-1.5 1.5 1.5 0 0 0 1.5-1.5.75.75 0 1 1 1.5 0 1.5 1.5 0 0 0 1.5 1.5.75.75 0 1 1 0 1.5 1.5 1.5 0 0 0-1.5 1.5.75.75 0 0 1-.75.75Zm-7 10a1 1 0 0 1-1-1 4 4 0 0 0-4-4 1 1 0 0 1 0-2 4 4 0 0 0 4-4 1 1 0 0 1 2 0 4 4 0 0 0 4 4 1 1 0 0 1 0 2 4 4 0 0 0-4 4 1 1 0 0 1-1 1Z" />
                </svg>
            </div>
            <!-- Position -->
            <div>
                <div class="font-medium text-slate-800 dark:text-slate-100">{{record.description}}</div>
                <div class="flex flex-nowrap items-center space-x-2 whitespace-nowrap">
                <div>{{record.filename}}</div>
                <div class="text-slate-400 dark:text-slate-600">·</div>
                <div>{{record.created_at}}</div>
                </div>
            </div>
            </div>
            <!-- Tags -->
            <div class="sm:ml-2 mt-2 sm:mt-0">
            <ul class="flex flex-wrap sm:justify-end -m-1">
                <li class="m-1">
                    <a :href="'/system/attachment/show/'+record.uuid" target="_blank" rel="noopener noreferrer">
                        <button class="inline-flex items-center justify-center text-xs font-medium leading-5 rounded-full px-2.5 py-0.5 border border-slate-200 dark:border-slate-700 hover:border-slate-300 dark:hover:border-slate-600 shadow-sm bg-white dark:bg-slate-800 text-slate-500 dark:text-slate-400 duration-150 ease-in-out">
                            <Icon icon="mdi:eye-outline" class="inline-flex text-indigo-500 mr-1" />

                            View
                        </button>
                    </a>
                </li>
            </ul>
            </div>
        </li>

        </ul>
    </div>
    </div>

  </div>

<!-- Sidebar -->
<div class="hidden lg:block space-y-4">

  <!-- Company information (desktop) -->
  <!-- <div class="bg-white dark:bg-slate-800 p-5 shadow-lg rounded-sm border border-slate-200 dark:border-slate-700 lg:w-72 xl:w-80">
    <div class="text-center mb-6">
      <div class="inline-flex mb-3">
        <img class="w-16 h-16 rounded-full" src="../../images/company-icon-01.svg" width="64" height="64" alt="Company 01" />
      </div>
      <div class="text-lg font-bold text-slate-800 dark:text-slate-100 mb-1">Revolut Ltd</div>
      <div class="text-sm text-slate-500 dark:text-slate-400 italic">179 Jobs Posted</div>
    </div>
    <div class="space-y-2">
      <button class="btn w-full bg-indigo-500 hover:bg-indigo-600 text-white">Apply Today -&gt;</button>
      <button class="btn w-full dark:bg-slate-800 border-slate-200 dark:border-slate-700 hover:border-slate-300 dark:hover:border-slate-600 text-slate-600 dark:text-slate-300">Company Profile</button>
    </div>
  </div> -->

</div>

</div>
   </div>
</template>

<script setup>
import { onMounted } from 'vue'

const props = defineProps({
    course: Object,
    attachments: Object,
})

onMounted(() => {
    // console.log(props.course);
    // console.log(props.attachments);
})
</script>

<style scoped>

</style>