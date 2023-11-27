<template>
    <div>
        <Head title="Course" />
        <x-create-edit-template :setup="setup" :selected="selected">
            <form v-on:submit.prevent="submit" action="#" method="POST" enctype="multipart/form-data">
                <x-grid>
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Code</template>
                            <template #value>
                                <TextInput type="text" v-model="form.code" @input="convertToUppercase"/>
                            </template>
                        </x-form-group>
                    </x-grid-col>
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Title</template>
                            <template #value>
                                <TextInput type="text" v-model="form.name"/>
                            </template>
                        </x-form-group>
                    </x-grid-col>
                    <x-grid-col class="col-span-12">
                        <x-form-group>
                            <template #label>Course</template>
                            <template #value>
                                <x-select v-model="form.course">
                                    <option value="">--select--</option>
                                    <option v-for="(course,index) in props.courses" v-bind:key="index" :value="course.id" :selected="course.id == form.course">{{course.title}}</option>
                                </x-select>
                            </template>
                        </x-form-group>
                    </x-grid-col>

                    <x-grid-col class="">
                        <x-form-group>
                            <template #label>Exam Type</template>
                            <template #value>
                                <TextInput type="text" v-model="form.exam_type" placeholder="e.g CAT"/>
                            </template>
                        </x-form-group>
                    </x-grid-col>

                    <x-grid-col class="">
                        <x-form-group>
                            <template #label>Max Score</template>
                            <template #value>
                                <TextInput type="text" v-model="form.max_score" placeholder="e.g 100"/>
                            </template>
                        </x-form-group>
                    </x-grid-col>
                    

                    <x-grid-col class="sm:col-span-12">
                        <x-form-group class="sm:grid-cols-1">
                            <template #label>Description</template>
                            <template #value>
                                <ckeditor v-cloak :editor="editor" v-model="form.description" @ready="cardData != null? form.description = cardData.description :''"></ckeditor>
                            </template>
                        </x-form-group>
                    </x-grid-col>
                   
                    <x-grid-col v-if="!form.uuid" class="sm:col-span-2">
                        <x-form-group>
                            <template #label>Attachments (can attach multiple)</template>
                            <template #value>
                                <TextInput type="file" id="file" ref="fileInput" @change="handleFileChange" multiple />
                            </template>
                        </x-form-group>
                        <!-- <div class="mt-6">
                            <div class="text-sm font-semibold text-slate-800 dark:text-slate-100 mb-2">Attachment</div>
                            <div class="rounded bg-slate-100 dark:bg-slate-700/30 border border-dashed border-slate-300 dark:border-slate-700 text-center px-5 py-8">
                                <svg class="inline-flex w-4 h-4 fill-slate-400 dark:fill-slate-500 mb-3" viewBox="0 0 16 16"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M8 4c-.3 0-.5.1-.7.3L1.6 10 3 11.4l4-4V16h2V7.4l4 4 1.4-1.4-5.7-5.7C8.5 4.1 8.3 4 8 4ZM1 2h14V0H1v2Z" />
                                </svg>
                                <label for="upload" class="block text-sm text-slate-500 dark:text-slate-400 italic">We accept
                                    PNG, JPEG, files.</label>
                                    <img v-if="show_image == '' && form.exam_path != null" :src="$page.props.storagePaths[setup.settings.storageName].exam.readPath+form.exam_path" class="h-20 w-20">

                                <input @input="onFileChange($event, form.exam_path, show_image)" ref="input" class="sr-only" id="upload" type="file" />
                            </div>
                        </div> -->
                    </x-grid-col>
                </x-grid>
                

                <div class="flex justify-center py-3">
                    <x-button type="submit">Submit</x-button>
                </div>

            </form>

        </x-create-edit-template>
    </div>
</template>
<script setup>
import { createEditProps, useCreateEdit } from '@/Composables/useCreateEdit'

import { ref, reactive, computed  } from 'vue'

const props = defineProps({
    ...createEditProps,
    courses:Object,
})


const file = ref(null);

const form = reactive({
    uuid: null,
    name: null,
    exam_type: null,
    exam_path: Array,
    code: null,
    course: null,
    max_score: null
})

const show_image = ref('')
const show_image1 = ref('')

const handleFileChange = (event) => {
    // form.exam_path = event.target.files[0];
    form.exam_path = Array.from(event.target.files);
};

function setData() {
    if (props.cardData != null && props.cardData.uuid != null) {
        form.uuid = props.cardData.uuid
        form.description = props.cardData.description
        form.name = props.cardData.name
        form.exam_type = props.cardData.exam_type
        // form.exam_path = props.cardData.exam_path
        form.code = props.cardData.code
        form.course = props.cardData.course_id
        form.max_score = props.cardData.max_score
    }
}

function convertToUppercase() {
    form.code = form.code.toUpperCase();
}
const { editor,editorConfig, submit, onFileChange, ckeditor, xGrid,
        xFormGroup,
        xGridCol,
        xLoading,
        xPanel,
        xInput,
        xSelect,
        xTextarea,
        xCheckbox,
        Checkbox,
        xButton,
        AppLayout,
        xCreateEditTemplate, TextInput } = useCreateEdit(props, setData, form )



</script>
<style scoped>
input[type="file"] {
  /* display: none; */
}

.custom-file-input {
  background-color: blue;
  color: white;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
}
/* 
label {
  background-color: blue;
  color: white;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
}

label::before {
  content: "Choose file";
} */

/* label::after {
  content: "📷";
} */

</style>