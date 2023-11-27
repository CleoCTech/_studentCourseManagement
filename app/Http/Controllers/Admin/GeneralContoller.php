<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Program;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class GeneralContoller extends Controller
{
    public function __construct(){
        $this->middleware('gen-auth');
        $this->middleware('admin-auth')->only('dashboard');
    }
    public function dashboard(){

        $user = User::where('id', '=', Auth::user()->id)->first();
        // info($user->roles);
        if ($user->hasRole('administrator') || $user->hasRole('instructor') || $user->hasRole('coordinator') || $user->hasRole('QA')) {
            //QA
            $users = User::all();
            $courses = Course::where('status', 2)->get();
            $programs = Program::where('status', 2)->get();
            $students = User::whereHasRole('student')->get();
            $instructors = User::whereHasRole('instructor')->get();
            $coordinators = User::whereHasRole('coordinator')->get();
            // $users = User::whereHasRole(['admin', 'regular-user'])->get();
            return Inertia::render('Admin/Pages/Dashboard', [
                'users' => count($users),
                'courses' => count($courses),
                'coordinators' => count($coordinators),
                'instructors' => count($instructors),
                'students' => count($students),
                'programs' => count($programs),
            ]);
        } elseif ($user->hasRole('student')) {

            $courses = Course::where('status', 2)->get();
            $programs = Program::where('status', 2)->get();

            return Inertia::render('Admin/Pages/StudentDashboard', [
                'role' => 'student',
                'courses' => count($courses),
                'programs' => count($programs),
            ]);
        }
    }
}
