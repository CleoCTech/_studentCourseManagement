<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="cleoctech@gmail.com - Wenla Systems">
        <title inertia>{{ config('app.name', 'Laravel') }}</title>

        {{-- <!-- Fonts --> --}}
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet">

        <!-- Core CSS -->
        {{-- <link rel="stylesheet" href="{{ asset('assets/vendor/css/core.css') }}"  />
        <link rel="stylesheet" href="{{ asset('assets/vendor/css/theme-default.css')}}" />
        <link rel="stylesheet" href="{{ asset('assets/css/demo.css')}}" /> --}}

        {{-- <!-- Icons. Uncomment required icon fonts --> --}}
        {{-- <link rel="stylesheet" href="{{ asset('assets/vendor/fonts/boxicons.css')}}" /> --}}

        {{-- <!-- Vendors CSS --> --}}
        {{-- <link rel="stylesheet" href="{{ asset('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css')}}" />

        <link rel="stylesheet" href="{{ asset('assets/vendor/libs/apex-charts/apex-charts.css')}}" /> --}}


        {{-- <script src="{{ asset('assets/vendor/js/helpers.js') }}"></script> --}}

        {{-- <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  --> --}}
        {{-- <script src="{{ asset('assets/js/config.js')}}"></script> --}}

        @routes
        {{-- @vite(['resources/js/app.js', "resources/js/Pages/{$page['component']}.vue"]) --}}
        @vite(['resources/js/app.js'])
        @inertiaHead
    </head>
    <body class="font-inter antialiased bg-slate-100 dark:bg-slate-900 text-slate-600 dark:text-slate-400">
        @inertia

        <div class="layout-wrapper layout-content-navbar">
           
            <div class="layout-overlay layout-menu-toggle"></div>
        </div>

       
       
        {{-- <script src="{{ asset('assets/vendor/libs/jquery/jquery.js')}}"></script>
        <script src="{{ asset('assets/vendor/libs/popper/popper.js')}}"></script>
        <script src="{{ asset('assets/vendor/js/bootstrap.js')}}"></script>
        <script src="{{ asset('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js')}}"></script> --}}

        {{-- <script src="{{ asset('assets/vendor/js/menu.js')}}"></script> --}}
        {{-- <!-- endbuild --> --}}

        {{-- <!-- Vendors JS --> --}}
        {{-- <script src="{{ asset('assets/vendor/libs/apex-charts/apexcharts.js')}}"></script> --}}

        {{-- <!-- Main JS --> --}}
        {{-- <script src="{{ asset('assets/js/main.js')}}"></script> --}}

        {{-- <!-- Page JS --> --}}
        {{-- <script src="{{ asset('assets/js/dashboards-analytics.js')}}"></script> --}}

        <script async defer src="https://buttons.github.io/buttons.js"></script>
        
    </body>
</html>
