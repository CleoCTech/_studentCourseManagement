<template>
    <div>
        <Head title="Property" />
        <x-create-edit-template :setup="setup" :selected="selected" :lines="relationships.units" :listPageTitle="setup.units">
            <form v-on:submit.prevent="submit" action="#" method="POST" enctype="multipart/form-data">
                <x-grid>
                    
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Name</template>
                            <template #value>
                                <TextInput type="text" v-model="form.name"/>
                                <!-- <x-input type="text" v-model="form.name"/> -->
                            </template>
                        </x-form-group>
                    </x-grid-col>
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Short Name</template>
                            <template #value><x-input type="text" v-model="form.shortName"/></template>
                        </x-form-group>
                    </x-grid-col>
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Emails</template>
                            <template #value><x-input type="text" v-model="form.emails"/></template>
                        </x-form-group>
                    </x-grid-col>
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Phone Numbers</template>
                            <template #value><x-input type="text" v-model="form.phoneNumbers"/></template>
                        </x-form-group>
                    </x-grid-col>
                    <x-grid-col>
                        <x-form-group>
                            <template #label>Address</template>
                            <template #value><x-input type="text" v-model="form.address"/></template>
                        </x-form-group>
                    </x-grid-col>
                    <x-grid-col>
                        <x-form-group>
                            <template #label>About Short</template>
                            <template #value><x-input type="text" v-model="form.aboutShort"/></template>
                        </x-form-group>
                    </x-grid-col>
                    
                    <x-grid-col class="sm:col-span-3">
                        <x-form-group class="sm:grid-cols-1">
                            <template #label>About</template>
                            <template #value>
                                <ckeditor v-cloak :editor="editor" v-model="form.about" @ready="cardData != null? form.about = cardData.about :''"></ckeditor>
                            </template>
                        </x-form-group>
                    </x-grid-col>
                    
                    <x-grid-col class="sm:col-span-2">
                        <div class="mt-6">
                            <div class="text-sm font-semibold text-slate-800 dark:text-slate-100 mb-2">Logo</div>
                            <div
                                class="rounded bg-slate-100 dark:bg-slate-700/30 border border-dashed border-slate-300 dark:border-slate-700 text-center px-5 py-8">
                                <svg class="inline-flex w-4 h-4 fill-slate-400 dark:fill-slate-500 mb-3" viewBox="0 0 16 16"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M8 4c-.3 0-.5.1-.7.3L1.6 10 3 11.4l4-4V16h2V7.4l4 4 1.4-1.4-5.7-5.7C8.5 4.1 8.3 4 8 4ZM1 2h14V0H1v2Z" />
                                </svg>
                                <label for="upload" class="block text-sm text-slate-500 dark:text-slate-400 italic">We accept
                                    PNG, JPEG, files.</label>
                                    <img v-if="show_image == '' && form.logo != null" :src="$page.props.storagePaths[setup.settings.storageName].images.readPath+form.logo" class="h-20 w-20">

                                <input @input="onFileChange($event, form.logo, show_image)" ref="input" class="sr-only" id="upload" type="file" />
                            </div>
                        </div>
                        <!-- <x-form-group>
                            <template #label>Logo</template>
                            <template #value>
                                <img v-if="show_image == '' && form.logo != null" :src="$page.props.storagePaths[setup.settings.storageName].images.readPath+form.logo" class="h-20 w-20">
                                <x-input type="file" @input="onFileChange($event, form.logo, show_image)" ref="input" class="shadow appearance-none border w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline disabled:opacity-40"/>
                                <img v-if="show_image != ''" :src="show_image" class="h-20 w-20">
                            </template>
                        </x-form-group> -->
                    </x-grid-col>
                </x-grid>
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

const props = defineProps({...createEditProps})

const form = reactive({
    uuid: null,
    name: null,
    shortName: null,
    about: null,
    aboutShort: null,
    emails: null,
    phoneNumbers: null,
    address: null,
    logo: null,
    city: null,
    state: null,
    postalCode: null,
    latitude: null,
    longitude: null,
    url: null,
    logo: null,
})

const show_image = ref('')
const show_image1 = ref('')

function setData() {
    if (props.cardData != null && props.cardData.uuid != null) {
        form.uuid = props.cardData.uuid
        form.name = props.cardData.name
        form.shortName = props.cardData.name_short
        form.emails = props.cardData.email
        form.address = props.cardData.address
        form.aboutShort = props.cardData.about_short
        form.about = props.cardData.about
        form.phoneNumbers = props.cardData.phone_no
        form.city = props.cardData.city
        form.state = props.cardData.state
        form.postalCode = props.cardData.postal_code
        form.latitude = props.cardData.latitude
        form.longitude = props.cardData.longitude
        form.url = props.cardData.url
        form.logo = props.cardData.logo

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

label::after {
  content: "📷";
}

</style>