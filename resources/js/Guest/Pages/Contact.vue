<template>
    <main>
        <section class="bg-white">

            <div class="container max-w-screen-xl mx-auto px-4">

                <Navbar />

                <div class="flex items-center justify-center pb-20">

                    <div class="mt-28 text-center">
                        <h1 class="font-semibold text-4xl md:text-6xl lg:text-7xl text-gray-900 leading-normal mb-6">Contact
                            Us</h1>
                        <p class="font-normal text-gray-400 text-lg md:text-xl text-center mx-auto mb-6 max-w-3xl">We invite
                            you to explore degree requirements, confirm your initial eligibility, and learn more about our
                            unique “earn your way in” admissions process.</p>


                    </div>


                </div>

                <div class="bg-blue-800 flex flex-col lg:flex-row items-center justify-evenly py-14 rounded-3xl">

                    <div class="text-center lg:text-left mb-10 lg:mb-0">
                        <h1 class="font-semibold text-white text-4xl md:text-5xl lg:text-7xl leading-normal mb-4">Talk to us
                            <br /> to discuss</h1>

                        <p class="font-normal text-white text-md md:text-xl">Need more time to discuss? Won’t worry, we are
                            <br /> ready to help you. You can fill in the column on the <br /> right to book a meeting with
                            us. Totally free.</p>
                    </div>

                    <div class="hidden xl:block xl:absolute right-0">
                        <img src="../../../../public/assets/images/book.png" alt="Image" />
                    </div>

                    <div class="hidden md:block bg-white xl:relative px-6 py-3 rounded-3xl">
                        <div class="py-3">
                            <h3 class="font-semibold text-gray-900 text-3xl">Book a meeting</h3>
                        </div>

                        <div class="py-3">
                            <input type="text" placeholder="Full Name"
                                class="px-4 py-4 w-96 bg-gray-100 placeholder-gray-400 rounded-xl outline-none" />
                        </div>

                        <div class="py-3">
                            <input type="text" placeholder="Email"
                                class="px-4 py-4 w-96 bg-gray-100 placeholder-gray-400 rounded-xl outline-none" />
                        </div>

                        <div class="py-3 relative">
                            <input type="text" placeholder="Date"
                                class="px-4 py-4 w-96 bg-gray-100 font-normal text-lg placeholder-gray-400 rounded-xl outline-none" />

                            <div class="absolute inset-y-0 left-80 ml-6 flex items-center text-xl text-gray-600">
                                <i data-feather="calendar"></i>
                            </div>
                        </div>

                        <div class="py-3 relative">
                            <input type="text" placeholder="Virtual Meeting"
                                class="px-4 py-4 w-96 bg-gray-100 placeholder-gray-400 rounded-xl outline-none" />

                            <div class="absolute inset-y-0 left-80 ml-6 flex items-center text-xl text-gray-600">
                                <i data-feather="chevron-down"></i>
                            </div>
                        </div>

                        <div class="py-3">
                            <button
                                class="w-full py-4 font-semibold text-lg text-white bg-blue-700 rounded-xl hover:bg-blue-900 transition ease-in-out duration-500">Booking</button>
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

<style scoped></style>