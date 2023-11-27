<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that's loaded on the first page visit.
     *
     * @see https://inertiajs.com/server-side-setup#root-template
     * @var string
     */
    protected $rootView = 'app';

    public function rootView(Request $request)
    {
        if(request()->is('admin/*') or request()->is('admin'))
        {
            return 'dashboard';
        }
        if(request()->is('student/*') or request()->is('student'))
        {
            return 'dashboard';
        }
        if(request()->is('system/*') or request()->is('system'))
        {
            return 'dashboard';
        }
        return parent::rootView($request);
    }

    /**
     * Determines the current asset version.
     *
     * @see https://inertiajs.com/asset-versioning
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    public function version(Request $request): ?string
    {
        return parent::version($request);
    }

    /**
     * Defines the props that are shared by default.
     *
     * @see https://inertiajs.com/shared-data
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function share(Request $request): array
    {
        $role = 'default';
        if ($request->user()) {
            $roles = $request->user()->roles;
            foreach ($roles as $role) {
                $role = $role->display_name;
            }
        }
        return array_merge(parent::share($request), [
            'csrf_token' => csrf_token(),
            'flash' => [
                'success' => fn () => $request->session()->get('success'),
                'error' => fn () => $request->session()->get('error'),
                'info' => fn () => $request->session()->get('info'),
                'warning' => fn () => $request->session()->get('warning'),
            ],
            'auth.user' => fn () => $request->user() ? $request->user()->only('id', 'name', 'email','profile_category','user_category') : null,
            'auth.role' => fn () => $request->user() ? $role : 'default',
            //custom
            'defaultErrors' => config('app.defaultErrors'),
            'config' => [
                'appName' => config('app.name'),
                'company' => [
                    'name' => config('app.company')['name'],
                    'shortName' => config('app.company')['shortName'],
                ],
                'developer' => [
                    'name' => 'Wenla Systems',
                    'website' => 'http://wenlasystems.com',
                ]
            ],
            'storagePaths' => config('app.storagePaths')
        ]);
    }
}
