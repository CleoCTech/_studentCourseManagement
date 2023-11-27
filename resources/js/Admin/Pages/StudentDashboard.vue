<script setup>
import { ref, provide, getCurrentInstance, onMounted  } from 'vue'
import WelcomeBanner from '@/Admin/Partials/Dashboard/WelcomeBanner.vue'
import DashboardCard1 from '@/Components/Dashboard/DashboardCard.vue'
import CourseCard from '@/Admin/Partials/Student/CourseCard.vue'
import ExamCard from '@/Admin/Partials/Student/ExamCard.vue'
// import DashboardAvatars from '@/Admin/Partials/Dashboard/DashboardAvatars.vue'

import FilterButton from '@/Components/Mosaic/DropdownFilter.vue'
import Datepicker from '@/Components/Mosaic/Datepicker.vue'

const props = defineProps({
  role:String,
  coursesCount:Number,
  programsCount:Number,
  examsCount:Number,
  courses:Object,
  exams:Object,
  programs:Object,
})
const salutation = ref('');
const context = getCurrentInstance()?.appContext.config.globalProperties;

const setSalutation = () => {
  const currentTime = new Date();
  const currentHour = currentTime.getHours();

  if (currentHour >= 5 && currentHour < 12) {
    salutation.value = 'Good morning';
  } else if (currentHour >= 12 && currentHour < 18) {
    salutation.value = 'Good afternoon';
  } else {
    salutation.value = 'Good evening';
  }
};

onMounted( async () => {
    context.$showLoading()
    setSalutation();
    setTimeout(() => {
        context.$hideLoading()
    }, 3000);
    // isLoading.value = false;
})

</script>
<template>
    <Head title="Dashboard" />
    <div class="px-4 sm:px-6 lg:px-8 py-8 w-full max-w-9xl mx-auto">
        <WelcomeBanner
        :name = "$page.props.auth.user.name"
        :salutation="salutation" 
         />

        <!-- Dashboard actions -->
        <div class="sm:flex sm:justify-between sm:items-center mb-8">
            <DashboardAvatars />
            <!-- Right: Actions -->
            <div class="grid grid-flow-col sm:auto-cols-max justify-start sm:justify-end gap-2">

                <!-- Filter button -->
                <!-- <FilterButton align="right" /> -->
                <!-- Datepicker built with flatpickr -->
                <!-- <Datepicker align="right" /> -->
                <!-- Add view button -->
                <button class="btn bg-indigo-500 hover:bg-indigo-600 text-white">
                    <svg class="w-4 h-4 fill-current opacity-50 shrink-0" viewBox="0 0 16 16">
                        <path d="M15 7H9V1c0-.6-.4-1-1-1S7 .4 7 1v6H1c-.6 0-1 .4-1 1s.4 1 1 1h6v6c0 .6.4 1 1 1s1-.4 1-1V9h6c.6 0 1-.4 1-1s-.4-1-1-1z" />
                    </svg>
                    <span class="hidden xs:block ml-2">Add View</span>
                </button>
            </div>
        </div>

        <!-- Page header -->
        <div class="mb-5">

            <!-- Title -->
            <h1 class="text-2xl md:text-3xl text-slate-800 dark:text-slate-100 font-bold">Find for you ✨</h1>

        </div>

        <!-- Search form -->
        <div class="max-w-xl mb-5">
            <form class="relative">
                <label for="app-search" class="sr-only">Search</label>
                <input id="app-search" class="form-input w-full pl-9 py-3 bg-white dark:bg-slate-800" type="search" placeholder="Search…" />
                <button class="absolute inset-0 right-auto group" type="submit" aria-label="Search">
                    <svg class="w-4 h-4 shrink-0 fill-current text-slate-400 dark:text-slate-500 group-hover:text-slate-500 dark:group-hover:text-slate-400 ml-3 mr-2" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
                    <path d="M7 14c-3.86 0-7-3.14-7-7s3.14-7 7-7 7 3.14 7 7-3.14 7-7 7zM7 2C4.243 2 2 4.243 2 7s2.243 5 5 5 5-2.243 5-5-2.243-5-5-5z" />
                    <path d="M15.707 14.293L13.314 11.9a8.019 8.019 0 01-1.414 1.414l2.393 2.393a.997.997 0 001.414 0 .999.999 0 000-1.414z" />
                    </svg>
                </button>
            </form>
        </div>

         <!-- Filters -->
        <div class="mb-4 border-b border-slate-200 dark:border-slate-700">
            <ul class="text-sm font-medium flex flex-nowrap -mx-4 sm:-mx-6 lg:-mx-8 overflow-x-scroll no-scrollbar">
              <li class="pb-3 mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                <a class="text-indigo-500 whitespace-nowrap" href="#0">View All</a>
              </li>
              <li class="pb-3 mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                <a class="text-slate-500 dark:text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 whitespace-nowrap" href="#0">Prorams</a>
              </li>
              <li class="pb-3 mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                <a class="text-slate-500 dark:text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 whitespace-nowrap" href="#0">Courses</a>
              </li>
              <li class="pb-3 mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                <a class="text-slate-500 dark:text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 whitespace-nowrap" href="#0">Exams</a>
              </li>
              <li class="pb-3 mr-6 last:mr-0 first:pl-4 sm:first:pl-6 lg:first:pl-8 last:pr-4 sm:last:pr-6 lg:last:pr-8">
                <a class="text-slate-500 dark:text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 whitespace-nowrap" href="#0">Online Events</a>
              </li>
             
            </ul>
        </div>

        <!-- Page content -->
        <div>
             <!-- Cards 1 (Video Courses) -->
             <div class="mt-8">
              <h2 class="text-xl leading-snug text-slate-800 dark:text-slate-100 font-bold mb-5">Courses</h2>
              <div class="grid grid-cols-12 gap-6">
                <template v-for="(course,index) in courses" v-bind:key="index">
                    <CourseCard :description="course.description"  :title="course.title" :uuid="course.uuid"/>
                </template>
              </div>
            </div>

             <div class="mt-8">
              <h2 class="text-xl leading-snug text-slate-800 dark:text-slate-100 font-bold mb-5">Exams</h2>
              <div class="grid grid-cols-12 gap-6">
                <template v-for="(exam,index) in exams" v-bind:key="index">
                    <ExamCard :description="exam.description"  :title="exam.code" :uuid="exam.uuid"/>
                </template>
              </div>
            </div>
        </div>
         
    </div>
</template>


