<?php

namespace App\Providers;

use App\Actions\Jetstream\DeleteUser;
use Illuminate\Support\ServiceProvider;
use Laravel\Jetstream\Jetstream;
use Laravel\Fortify\Fortify;
use Illuminate\Http\Request;

class JetstreamServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        $this->configurePermissions();

        Jetstream::deleteUsersUsing(DeleteUser::class);

        Fortify::loginView(function (Request $request) {
            // info('Guest Login');
            return inertia("Guest/Auth/Login")->toResponse($request);
        });

        Fortify::registerView(function (Request $request) {
            return inertia("Guest/Auth/Register")->toResponse($request);
        }); 

        Fortify::requestPasswordResetLinkView(function (Request $request) {
            return inertia('Guest/Auth/ForgotPassword')->toResponse($request);
        });

        Fortify::resetPasswordView(function (Request $request) {
            $token = $request->route('token'); // Get the token from the URL parameters
            return inertia('Guest/Auth/ResetPassword', ['token' => $token])->toResponse($request);
        });
        

        Fortify::verifyEmailView(function (Request $request) {
            return inertia('Guest/Auth/VerifyEmail')->toResponse($request);
        });

        Fortify::twoFactorChallengeView(function (Request $request) {
            return inertia('Guest/Auth/TwoFactorChallenge')->toResponse($request);
        });

        Fortify::confirmPasswordView(function (Request $request) {
            return inertia('Guest/Auth/ConfirmPassword')->toResponse($request);
        });
        

    }

    /**
     * Configure the permissions that are available within the application.
     */
    protected function configurePermissions(): void
    {
        Jetstream::defaultApiTokenPermissions(['read']);

        Jetstream::permissions([
            'create',
            'read',
            'update',
            'delete',
        ]);
    }
}
