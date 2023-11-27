<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Exam;
use App\Models\System\Attachment;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use App\Traits\Admin\LayoutTrait;

class GeneralContoller extends Controller
{
    use LayoutTrait;

    public function dashboard()
    {
        if (Auth::user()->status == 1) {
            // Auth::logout();
            Auth::guard('web')->logout();
            return Inertia::render('Guest/Auth/Login', [
                'error' => 'Oops! Your account has been suspended. Kindly consult the management',
                'redirectUrl' => '/login', 
            ]);
            $this->notificationAll('error', 'Oops! the user has not been assigned a role in the system');
            // router.visit(props.setup.settings.indexRoute);
            return Inertia::location(route('login'));
            // return redirect('/login')
            // ->with('error','Oops! the user has not been assigned a role in the system');

            // return Inertia::render('Guest/Auth/Login', [
            //     'error' => 'Oops! your account has been suspended. Kindly consult the management',
            // ]);
            // return redirect('/login')->with('error','Oops! your account has been suspended. Kindly consult the management');
        }
        if(Auth::user()->user_category == 100){
            $user = User::where('id', Auth::user()->id)->first();
            if ($user->status != '2') {
                // Auth::logout();
                Auth::guard('web')->logout();
                return redirect('/login')->with('error','Oops! the user has not been assigned a role in the system');
            }
            // if ($user->hasRole('admin')) {
                
            // }
            // $user = AdminUser::select('status','role')->where('email',Auth::user()->email)->first();
            // if($user == null || $user->role == null){
            //     Auth::logout();
            //     return redirect('/login')->with('error','Oops! your authorization as an admin failed.');
            // }
            // $role = UserRole::find($user->role);
            // // Log::info($role);
            // if($role == null){
            //     Auth::logout();
            //     return redirect('/login')->with('error','Oops! the user has not been assigned a role in the system');
            // }
            $user['profile_category'] = 'administrator';
            // $user['permissions'] = $role->permissions;
            Auth::user()->profile = $user;

            return redirect('/admin/dashboard');
        }else{
            $user = User::where('id', '=', Auth::user()->id)->first();
            if ($user->hasRole('student')) {
                // $user['profile_category'] = 'student';
                // Auth::user()->profile = $user;
                // Auth::user()->profile = 'student';

                return redirect('/student/dashboard');
            } elseif ($user->hasRole('instructor')) {
                return redirect('/admin/dashboard');
                // return Inertia::render('Admin/Pages/Dashboard');
            }  elseif ($user->hasRole('coordinator')) {
                return redirect('/admin/dashboard');
            }  elseif ($user->hasRole('QA')) {
                return redirect('/admin/dashboard');
            }
            else {
                Auth::guard('web')->logout();
                return redirect('/login')->with('error','Oops! the user has not been assigned a role in the system');
            }
           
        }
    }

    public function home()
    {
        return Inertia::render('Guest/Pages/Home');
    }
    public function about()
    {
        return Inertia::render('Guest/Pages/About');
    }
    public function services()
    {
        return Inertia::render('Guest/Pages/Services');
    }
    public function contact()
    {
        return Inertia::render('Guest/Pages/Contact');
    }
    public function getCourse($uuid)
    {
        $course = Course::with('program')
        ->where('uuid', $uuid)->first();
        $model = 'courses';
       // $model = ucfirst($tableId); // Converts 'courses' to 'Course'

        // Use dynamic relationship
        $attachments = Attachment::where('table_id', $model)
            ->where('record_id', $course->uuid)
            ->with('attachable') // Eager load the related model (Course in this example)
            ->get();

        return [
            'course' => $course,
            'attachmentsCount' => count($attachments),

        ];
    }

    public function getExam($uuid)
    {
        $exam = Exam::with('course')
        ->where('uuid', $uuid)->first();
        $model = 'exams';
       // $model = ucfirst($tableId); // Converts 'courses' to 'Course'

        // Use dynamic relationship
        $attachments = Attachment::where('table_id', $model)
            ->where('record_id', $exam->uuid)
            ->with('attachable') // Eager load the related model (Course in this example)
            ->get();

        return [
            'exam' => $exam,
            'attachmentsCount' => count($attachments),

        ];
    }
}
