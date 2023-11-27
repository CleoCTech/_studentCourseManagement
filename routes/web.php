<?php

use App\Http\Controllers\Admin\CourseController;
use App\Http\Controllers\Admin\ExamController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\Admin\GeneralContoller as AdminGeneralController;
use App\Http\Controllers\Admin\GradingController;
use App\Http\Controllers\Admin\ProgramController;
use App\Http\Controllers\GeneralContoller as GuestGeneralContoller;
use App\Http\Controllers\Student\StudentController;
use App\Http\Controllers\System\AttachmentsController as SystemAttachmentsController;

use App\Http\Controllers\System\UsersContoller;
use Illuminate\Support\Facades\Artisan;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return redirect()->route('login');

//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         // 'canRegister' => Route::has('register'),
//         // 'laravelVersion' => Application::VERSION,
//         // 'phpVersion' => PHP_VERSION,
//     ]);
// });

//Guest
Route::get('/',[GuestGeneralContoller::class,'home'])->name('home');
Route::get('/about',[GuestGeneralContoller::class,'about'])->name('about');
Route::get('/services',[GuestGeneralContoller::class,'services'])->name('services');
Route::get('/contact',[GuestGeneralContoller::class,'contact'])->name('contact');
Route::get('/course/{uuid}',[GuestGeneralContoller::class,'getCourse'])->name('course');
Route::get('/exam/{uuid}',[GuestGeneralContoller::class,'getExam'])->name('exam');

// Route::middleware([
//     'auth:sanctum',
//     config('jetstream.auth_session'),
//     'verified',
// ])->group(function () {
//     Route::get('/dashboard', function () {
//         return Inertia::render('Dashboard');
//     })->name('dashboard');
// });


Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {

    /**
     * Auth User
     */
    Route::get('/dashboard',[GuestGeneralContoller::class,'dashboard'])->name('guest-dashboard');
    
});



Route::prefix('student')->group(function () {
    Route::get('/dashboard',[StudentController::class,'dashboard'])->name('student.dashboard');

   
    /***
     * Program Management
     */
    Route::get('/program',[ProgramController::class,'index'])->name('student.program');
    Route::get('/program/create',[ProgramController::class,'create']);
    Route::get('/program/show/{uuid}',[ProgramController::class,'show']);
    Route::get('/program/edit/{uuid}',[ProgramController::class,'edit']);
    Route::post('/program/store',[ProgramController::class,'store']);
    Route::delete('/program/delete/{uuid}',[ProgramController::class,'destroy']);
    Route::get('/program/report/{name}',[ProgramController::class,'report']);

    // Route::get('/property/unit/edit/{uuid}',[UnitController::class,'edit']);
    // Route::get('/property/unit/{uuid}',[UnitController::class,'test']);


     /***
     * Course Management
     */
    Route::get('/course',[CourseController::class,'index'])->name('student.course');
    Route::get('/course/create',[CourseController::class,'create']);
    Route::get('/course/show/{uuid}',[StudentController::class,'show']);
    Route::get('/course/edit/{uuid}',[CourseController::class,'edit']);
    Route::post('/course/store',[CourseController::class,'store']);
    Route::delete('/course/delete/{uuid}',[CourseController::class,'destroy']);
    Route::get('/course/report/{name}',[CourseController::class,'report']);
     /***
     * Exam Management
     */
    Route::get('/exam',[CourseController::class,'index'])->name('student.exam');
    Route::get('/exam/create',[CourseController::class,'create']);
    // Route::get('/exam/show/{uuid}',[StudentController::class,'show']);
    Route::get('/exam/show/{uuid}',[StudentController::class,'showExam']);
    Route::get('/exam/edit/{uuid}',[CourseController::class,'edit']);
    Route::post('/exam/store',[CourseController::class,'store']);
    Route::delete('/exam/delete/{uuid}',[CourseController::class,'destroy']);
    Route::get('/exam/report/{name}',[CourseController::class,'report']);

    Route::post('/exam/submit',[StudentController::class,'submitExam'])->name('student.examSubmit');

});
Route::prefix('admin')->group(function () {
    Route::get('/dashboard',[AdminGeneralController::class,'dashboard'])->name('admin.dashboard');

   
    /***
     * Program Management
     */
    Route::get('/program',[ProgramController::class,'index'])->name('admin.program');
    Route::get('/program/create',[ProgramController::class,'create']);
    Route::get('/program/show/{uuid}',[ProgramController::class,'show']);
    Route::get('/program/edit/{uuid}',[ProgramController::class,'edit']);
    Route::post('/program/store',[ProgramController::class,'store']);
    Route::delete('/program/delete/{uuid}',[ProgramController::class,'destroy']);
    Route::get('/program/report/{name}',[ProgramController::class,'report']);

    // Route::get('/property/unit/edit/{uuid}',[UnitController::class,'edit']);
    // Route::get('/property/unit/{uuid}',[UnitController::class,'test']);


     /***
     * Course Management
     */
    Route::get('/course',[CourseController::class,'index'])->name('admin.course');
    Route::get('/course/create',[CourseController::class,'create']);
    Route::get('/course/show/{uuid}',[CourseController::class,'show']);
    Route::get('/course/edit/{uuid}',[CourseController::class,'edit']);
    Route::post('/course/store',[CourseController::class,'store']);
    Route::delete('/course/delete/{uuid}',[CourseController::class,'destroy']);
    Route::get('/course/report/{name}',[CourseController::class,'report']);

     /***
     * Exams Management
     */
    Route::get('/exam',[ExamController::class,'index'])->name('admin.exam');
    Route::get('/exam/create',[ExamController::class,'create']);
    Route::get('/exam/show/{uuid}',[ExamController::class,'show']);
    Route::get('/exam/edit/{uuid}',[ExamController::class,'edit']);
    Route::post('/exam/store',[ExamController::class,'store']);
    Route::delete('/exam/delete/{uuid}',[ExamController::class,'destroy']);
    Route::get('/exam/report/{name}',[ExamController::class,'report']);

     /***
     * Grading Management
     */
    Route::get('/grading',[GradingController::class,'index']);
    Route::get('/grading/create',[GradingController::class,'create'])->name('admin.grading');
    Route::post('/grading/store',[GradingController::class,'store']);

    Route::get('/grading/exams/{id}',[GradingController::class,'exams']);
    Route::get('/grading/{id}',[GradingController::class,'grading']);


});

Route::prefix('system')->group(function () {
   
    /***
     * User Management
     */
    Route::get('/user',[UsersContoller::class,'index'])->name('system.user');
    Route::get('/user/create',[UsersContoller::class,'create']);
    Route::get('/user/show/{uuid}',[UsersContoller::class,'show']);
    Route::get('/user/edit/{uuid}',[UsersContoller::class,'edit']);
    Route::post('/user/store',[UsersContoller::class,'store']);
    Route::delete('/user/delete/{uuid}',[UsersContoller::class,'destroy']);
    Route::get('/user/report/{name}',[UsersContoller::class,'report']);


    /***
     * Attachment
     */
    Route::get('/attachment/index/{tableName}/{recordId}',[SystemAttachmentsController::class,'index']);
    Route::get('/attachment/show/{uuid}',[SystemAttachmentsController::class,'show']);
    Route::post('/attachment/store',[SystemAttachmentsController::class,'store']);
    Route::delete('/attachment/delete/{uuid}',[SystemAttachmentsController::class,'destroy']);
    
});

Route::get('/storage-link', function() {
    Artisan::call('storage:link');
    return redirect('/');
});
Route::get('/optimize', function() {
    Artisan::call('optimize');
    return redirect('/');
});