<template>
   <main>
        <section class="bg-white mb-20 md:mb-52 xl:mb-72">
            <div class="container max-w-screen-xl mx-auto px-4">
                <Navbar />

                <div class="flex items-center justify-center xl:justify-start">

                    <div class="mt-28 text-center xl:text-left">
                        <h1 class="font-semibold text-4xl md:text-6xl lg:text-7xl text-gray-900 leading-normal mb-6">Master’s Degree <br /> Program in<br/> Software Engineering</h1>

                        <p class="font-normal text-xl text-gray-400 leading-relaxed mb-12">Develop advanced technical skills and knowledge to solve real-world challenges. <br/> Master the theories and applications of computer technology in our graduate program<br /> in computer science. Through our online course curriculum and a 3-week on-campus <br /> experience, you’ll gain a deep understanding of the field and prepare for <br /> a dynamic career.</p>

                        <Link href="/services" class="px-6 py-4 bg-blue-700 text-white font-semibold text-lg rounded-xl hover:bg-blue-900 transition ease-in-out duration-500">Start Your Journey</Link>
                    </div>

                    <div class="hidden xl:block xl:absolute z-0 top-30 right-20 max-w-150 rounded-2xl">
                        <img src="../../../../public/assets/images/qw.png" alt="Home img" class="rounded-2xl" />
                    </div>

                </div>
            </div>
        </section>
        <section class="bg-white py-10 md:py-16 xl:relative">
            <div class="container max-w-screen-xl mx-auto px-4">

                <div class="flex flex-col xl:flex-row justify-end">

                    <div class="hidden xl:block xl:absolute left-0 bottom-0 w-full">
                        <img src="../../../../public/assets/images/ww.png" alt="Feature img" />
                    </div>

                    <div class="">

                        <h1 class="font-semibold text-gray-900 text-xl md:text-4xl leading-normal mb-6 text-right">Program Benefits</h1>

                        <p class="font-normal text-gray-400 text-md md:text-xl mb-16 text-right">
                            Customizable online curriculum
                        </p>

                        <div class="flex flex-col md:flex-row justify-center xl:justify-start space-x-4 mb-20">
                            <div class="px-8 h-20 mx-auto md:mx-0 bg-gray-200 rounded-lg flex items-center justify-center mb-5 md:mb-0">
                                <!-- <i data-feather="check-circle" class=" text-green-900"></i> -->
                                <Icon icon="mdi:check-circle" class=" text-green-900" />
                            </div>

                            <div class="text-center md:text-left">
                                <h4 class="font-semibold text-gray-900 text-2xl mb-2 text-right">Advanced Design and Engineering Skills</h4>
                                <p class="font-normal text-gray-400 text-xl leading-relaxed text-right">Customizable online curriculum <br/> that can be completed part time</p>
                            </div>
                        </div>

                        <div class="flex flex-col md:flex-row justify-center xl:justify-start space-x-4 mb-20">
                            <div class="px-8 h-20 mx-auto md:mx-0 bg-gray-200 rounded-lg flex items-center justify-center mb-5 md:mb-0">
                                <Icon icon="mdi:database-lock" class=" text-green-900" />
                            </div>

                            <div class="text-center md:text-left">
                                <h4 class="font-semibold text-gray-900 text-2xl mb-2 text-right">Data Analytics and Big Data Engineering</h4>
                                <p class="font-normal text-gray-400 text-xl leading-relaxed text-right">Expert instruction from our faculty<br/> and industry professionals</p>
                            </div>
                        </div>

                        <div class="flex flex-col md:flex-row justify-center xl:justify-start space-x-4">
                            <div class="px-8 h-20 mx-auto md:mx-0 bg-gray-200 rounded-lg flex items-center justify-center mb-5 md:mb-0">
                                <Icon icon="mdi:credit-card" class=" text-green-900" />
                            </div>

                            <div class="text-center md:text-left">
                                <h4 class="font-semibold text-gray-900 text-2xl mb-2 text-right">High-Demand Field with Real-World Impact</h4>
                                <p class="font-normal text-gray-400 text-xl leading-relaxed text-right">Personalized academic and <br/> career advising  partners</p>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </section>
   </main>
   <Footer />
</template>

<script setup>
import Navbar from '@/Guest/Partials/Navbar.vue'
import Footer from '@/Guest/Partials/Footer.vue'


</script>

<style scoped>

</style>