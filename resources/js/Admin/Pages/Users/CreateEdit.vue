<template>
    <div>
        <Head title="User" />
        <x-create-edit-template :setup="setup" :selected="selected">
            <form v-on:submit.prevent="submit" action="#" method="POST" enctype="multipart/form-data">
                <x-grid>
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Full Name</template>
                            <template #value>
                                <TextInput type="text" v-model="form.name"/>
                            </template>
                        </x-form-group>
                    </x-grid-col>
                    
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Email</template>
                            <template #value><x-input type="email" v-model="form.email"/></template>
                        </x-form-group>
                    </x-grid-col>
                </x-grid>
                <div class="pt-3">
                    <h2 class="text-2xl text-slate-800 dark:text-slate-100 font-bold mb-6">Roles</h2>
                    <div class="flex flex-wrap items-center -m-3">

                    <div v-for="(role,index) in props.roles" v-bind:key="index" class="m-3">
                        <!-- Start -->
                        <label class="flex items-center">
                        <input type="radio" name="radio-buttons" class="form-radio"
                        :value="role.name"
                        v-model="form.role"
                        :checked="role.name === form.role"/>
                        <span class="text-sm ml-2">{{role.display_name}}</span>
                        </label>
                        <!-- End -->
                    </div>

                    

                    </div>
                </div>
                <div class="flex justify-center py-2">
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
    roles:Object,
    role:String
})

const form = reactive({
    uuid: null,
    name: null,
    email: null,
    role: null
})

const show_image = ref('')
const show_image1 = ref('')

function setData() {
    // console.log(props.roles);
    if (props.cardData != null && props.cardData.uuid != null) {
        // console.log(props.roles);
        form.uuid = props.cardData.uuid
        form.name = props.cardData.name
        form.email = props.cardData.email
        form.role = props.role
        // console.log(props.role);
    }
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