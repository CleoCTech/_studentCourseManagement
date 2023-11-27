<template>
    <div>
        <Head title="Grading" />
        <form v-on:submit.prevent="submit" action="#" method="POST" enctype="multipart/form-data">
            <x-grid>
                <x-grid-col class="col-span-12">
                    <x-form-group>
                        <template #label>Course</template>
                        <template #value>
                            <x-select v-model="form.course" @change="courseChange">
                                <option value="">--select--</option>
                                <option v-for="(course,index) in props.courses" v-bind:key="index" :value="course.id" :selected="course.id == form.course" >{{course.title}}</option>
                            </x-select>
                        </template>
                    </x-form-group>
                </x-grid-col>
                <x-grid-col class="col-span-12">
                    <x-form-group>
                        <template #label>Exams</template>
                        <template #value>
                            <x-select v-model="form.exam" @change="examChange">
                                <option value="">--select--</option>
                                <option v-for="(exam,index) in exams" v-bind:key="index" :value="exam.id" :selected="exam.id == form.exam" >{{exam.code}} - {{exam.name}}</option>
                            </x-select>
                        </template>
                    </x-form-group>
                </x-grid-col>
                <x-grid-col class="col-span-12">
                    <x-form-group>
                        <template #label>Student</template>
                        <template #value>
                            <x-select v-model="form.student">
                                <option value="">--select--</option>
                                <option v-for="(student,index) in props.students" v-bind:key="index" :value="student.id" :selected="student.id == form.student">{{student.name}} - {{ student.email}}</option>
                            </x-select>
                        </template>
                    </x-form-group>
                </x-grid-col>
                <x-grid-col >
                    <x-form-group>
                        <template #label>Score</template>
                        <template #value>
                            <!-- <TextInput type="text" v-model="form.grade" placeholder="e.g 100"/> -->
                            <div class="relative">
                                <input id="suffix" v-model="form.grade" class="form-input w-full pr-2" type="text" placeholder="30" />
                                <div class="absolute inset-0 left-auto flex items-center pointer-events-none">
                                    <span class="text-sm text-slate-400 dark:text-slate-500 font-medium px-3">{{maxScore}}</span>
                                </div>
                            </div> 
                        </template>
                    </x-form-group>
                </x-grid-col>
                <x-grid-col >
                    <x-form-group>
                        <template #label>Grade</template>
                        <template #value>
                            <TextInput type="text" v-model="form.desc" placeholder="e.g A" @input="convertToUppercase"/>
                        </template>
                    </x-form-group>
                </x-grid-col>
            </x-grid>

            <div class="flex justify-center py-3">
                <x-button type="submit">Submit</x-button>
            </div>
        </form>

        <br>
        <br>

        <div class="bg-white dark:bg-slate-800 shadow-lg rounded-sm border border-slate-200 dark:border-slate-700 relative m-6">
            <header class="px-5 py-4">
                <h2 class="font-semibold text-slate-800 dark:text-slate-100">Graded Students<span class="text-slate-400 dark:text-slate-500 font-medium"></span></h2>
            </header>
            <div>
                <div class="overflow-x-auto"> 
                    <table class="table-auto w-full dark:text-slate-300">
                        <thead class="text-xs font-semibold uppercase text-slate-500 dark:text-slate-400 bg-slate-50 dark:bg-slate-900/20 border-t border-b border-slate-200 dark:border-slate-700">
                            <tr>
                                <th class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="font-semibold text-left">Student Name</div>
                                </th>
                                <th class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="font-semibold text-left">Email</div>
                                </th>
                                <th class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="font-semibold text-left">Course</div>
                                </th>
                                <th class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="font-semibold text-left">Score</div>
                                </th>
                                <th class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="font-semibold text-left">Grade</div>
                                </th>
                                <th class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                </th>
                            </tr>
                        </thead>
                        <tbody class="text-sm divide-y divide-slate-200 dark:divide-slate-700"> 
                            <tr v-for="(record,index) in gradings" v-bind:key="index">
                                <td class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="text-left">{{record.user.name}}</div>
                                </td>
                                <td class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="text-left">{{record.user.email}}</div>
                                </td>
                                <td class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="text-left">{{record.course.title}}</div>
                                </td>
                                <td class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="text-left">{{record.grade}}</div>
                                </td>
                                <td class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <div class="text-left">{{record.desc}}</div>
                                </td>
                                <td class="px-2 first:pl-5 last:pr-5 py-3 whitespace-nowrap">
                                    <EditMenu align="right" class="relative inline-flex">
                                    <li>
                                        <a class="font-medium text-sm text-slate-600 dark:text-slate-300 hover:text-slate-800 dark:hover:text-slate-200 flex py-1 px-3" href="#0">Edit</a>
                                    </li>                                    
                                    <li>
                                        <a class="font-medium text-sm text-rose-500 hover:text-rose-600 flex py-1 px-3" href="#0">Remove</a>
                                    </li>
                                    </EditMenu>
                                </td>
                            </tr>
                           
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted, reactive } from 'vue'

import xGrid from '@/Components/Grid.vue'
import xGridCol from '@/Components/GridCol.vue'
import xLoading from '@/Components/Loading.vue'
import xPanel from '@/Components/Panel.vue'
import xFormGroup from '@/Components/FormGroup.vue'
import xInput from '@/Components/TextInput.vue'
import Checkbox from '@/Components/Mosaic/Checkbox.vue'
// import xInput from '@/Components/Input.vue'
import xSelect from '@/Components/Select.vue'
import xTextarea from '@/Components/Textarea.vue'
import xCheckbox from '@/Components/Checkbox.vue'
import xButton from '@/Components/Button.vue'
import CKEditor from '@ckeditor/ckeditor5-vue';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import AppLayout from '@/System/Layouts/AppLayout.vue'
import xCreateEditTemplate from '@/System/Pages/Templates/CRUD/CreateEdit.vue'
import Table from '@/Components/Mosaic/Table/Table.vue'

import TextInput from '@/Components/TextInput.vue';
import EditMenu from '@/Components/Mosaic/DropdownEditMenu.vue'

import { provide, getCurrentInstance, ref } from 'vue'
import {useNotify} from "@/Composables/useNotify";
import { usePage, router } from '@inertiajs/vue3'

let {notification} = useNotify();

const context = getCurrentInstance()?.appContext.config.globalProperties;


const props = defineProps({
    courses: Object,
    setup: Array,
    students: Object,
})


const form = reactive({
    uuid: null,
    course: null,
    exam: null,
    grade: null,
    desc: null,
    student: null,
})

const selectedCourseRecord = ref(null);
const selectedExamRecord = ref(null);
const exams = ref([]);
const gradings = ref([]);
const maxScore = ref(0);


const submit = () => {
    context.$showLoading();
    let formData = new FormData();


    for (let key in form) {
        formData.append(key, form[key]);
    }

    axios.post(props.setup.settings.indexRoute+'/store',formData).then(response => {
        console.log(response);
        context.$hideLoading()
        if(response.status == 200){
            notification(response.data.message, response.data.type);
            // router.visit(props.setup.settings.indexRoute);
            form.course = null;
            form.student = null;
            form.desc  = null;
            form.grade = null;
            form.exam = null;
        }
        else{
            notification(usePage().props.defaultErrors.default, 'error');
        }
        // isLoading = false;
        context.$hideLoading()
    }).catch((error) => {
        console.error(error);
        if(error.response.status == 422){
            var errors= [];
            errors = error.response.data.errors;
            for (let field of Object.keys(errors)) {
                notification(errors[field][0], 'error');
            }
        }else{
            notification(usePage().props.defaultErrors.default, 'error');
        }            
        // isLoading = false;
        context.$hideLoading()
    })

};

const courseChange = async () => {
    context.$showLoading();
    //load exams
    // const response = await this.$inertia.get(`/api/courses/${form.course}/students`);
    axios.get('/admin/grading/exams/'+form.course).then(response => {
        exams.value = response.data;
        context.$hideLoading();
    }).catch((error) => {
        notification(usePage().props.defaultErrors.default, 'error');
    })

    // console.log(form.course);
    // console.log(props.courses[form.course]);
    // // courses.value[selectedCourse.value];
    // selectedCourseRecord.value = props.courses[form.course];
    // console.log(selectedCourseRecord);

   

};

const examChange = async () => {
    context.$showLoading();

    selectedExamRecord.value = exams.value.find(exam => exam.id == form.exam);
    maxScore.value = '/' + selectedExamRecord.value.max_score

    axios.get('/admin/grading/'+form.exam).then(response => {
        gradings.value = response.data;
        context.$hideLoading();
    }).catch((error) => {
        notification(usePage().props.defaultErrors.default, 'error');
    })

}
function convertToUppercase() {
    form.desc = form.desc.toUpperCase();
}

</script>

<style scoped>

</style>