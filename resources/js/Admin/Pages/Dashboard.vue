<script setup>
import { ref, provide, getCurrentInstance, onMounted  } from 'vue'
import WelcomeBanner from '@/Admin/Partials/Dashboard/WelcomeBanner.vue'
import DashboardCard1 from '@/Components/Dashboard/DashboardCard.vue'
import StatsCard from '@/Components/Dashboard/StatsCard.vue'
// import DashboardAvatars from '@/Admin/Partials/Dashboard/DashboardAvatars.vue'

import FilterButton from '@/Components/Mosaic/DropdownFilter.vue'
import Datepicker from '@/Components/Mosaic/Datepicker.vue'

const props = defineProps({
  users:Number,
  courses:Number,
  coordinators:Number,
  instructors:Number,
  students:Number,
  programs:Number,
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
                <Datepicker align="right" />
                <!-- Add view button -->
                <button class="btn bg-indigo-500 hover:bg-indigo-600 text-white">
                    <svg class="w-4 h-4 fill-current opacity-50 shrink-0" viewBox="0 0 16 16">
                        <path d="M15 7H9V1c0-.6-.4-1-1-1S7 .4 7 1v6H1c-.6 0-1 .4-1 1s.4 1 1 1h6v6c0 .6.4 1 1 1s1-.4 1-1V9h6c.6 0 1-.4 1-1s-.4-1-1-1z" />
                    </svg>
                    <span class="hidden xs:block ml-2">Add View</span>
                </button>
            </div>
        </div>
         <!-- Cards -->
         <div class="grid grid-cols-12 gap-6">
              <DashboardCard1 :title="'Programs'" :total="programs" :action="'Available Programs'" />
              <DashboardCard1 :title="'Courses'" :total="courses" :action="'Course Catalog'" />
              <DashboardCard1 :title="'Users'" :total="users" :action="'Users'" />
              <DashboardCard1 :title="'Instructors'" :total="instructors" :action="'Instructors'" />
              <DashboardCard1 :title="'Students'" :total="students" :action="'Active Students'" />
              <DashboardCard1 :title="'Coordinators'" :total="coordinators" :action="'Coordinators'" />

         </div>
         
    </div>
</template>


