<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Exam;
use App\Models\Grade;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Traits\Admin\LayoutTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class GradingController extends Controller
{
    use LayoutTrait;

    public function __construct(){
        $this->middleware('gen-auth');
        $this->middleware('admin-auth');
    }

    public $settings = [
        'model' =>  '\\App\\Models\\Grade',
        'caption' =>  "Grading",
        'xFolder' =>  "Admin/Pages/Grading",
        'indexRoute' =>  "/admin/grading",
        'storageName' =>  "grading",
        'storageName2' =>  "adminAttachments",
        'isList' => true,
        'isCreate' => true,
        'isView' => true,
        'isEdit' => true,
        'isDelete' => true,
        'isActions' => true,
        'isAttachments' => true,
        'isReports' => false,
        'isCharts' => false,
        'isSearch' => true,
        'isReltionship' => true,
        // 'relationName' => ['program', 'materials', 'exams', 'users'],
        'relationName' => ['course'],
        'paginateRelation' => false,
        'isSelect' => true,
        'isMoreActions' => false,
        'xMoreActions' => null,
        'isExport' => false,
        'orderBy' => ['column' => 'created_at', 'order' => 'DESC'],
        'ListPart' => [
            
        ]
    ];

    public function index()
    {
        $courses = Course::where('status', 2)->get();
        $students = User::whereHasRole('student')->get();

        
    }

    public function create()
    {
        $courses = Course::where('status', 2)->get();
        $exams = Exam::where('status', 2)->get();
        $students = User::whereHasRole('student')->get();
        $this->setup['settings'] = $this->settings;

        return Inertia::render('Admin/Pages/Grading/Grading', [
            'courses' => $courses,
            'students' => $students,
            'setup' => $this->setup,
        ]);
        
    }

    public function store(REQUEST $request)
    {
        $this->validate($request, [
            'course' => 'required',
            'exam' => 'required',
            'grade' => 'required',
            'desc' => 'required',
            'student' => 'required',
        ]);

        DB::beginTransaction();
        try {

            $this->pKey = $request->uuid;

            $record = [
                'grade' => $request->grade,
                'desc' => $request->desc,
                'course_id' => $request->course,
                'exam_id' => $request->exam,
                'user_id' => $request->student,
                'status' => 2,
            ];
            $check = Grade::where('exam_id', $request->exam)
            ->where('user_id', $request->student)
            ->first();
            if ($check) {
                $response = $this->notificationAll('error', 'Grading has been done already for this course and student');
                return response()->json($response,500);
            }
            if($this->pKey == null){
                $record['created_by'] = Auth::user()->email;
            }else{
                $record['updated_by'] = Auth::user()->email;
            }

            $exam = $this->settings['model']::updateOrCreate(["uuid" => $this->pKey], $record);
            if($this->isCommit){
                DB::Commit();
                $response = $this->notification('success');
                return response()->json($response,200);
            }else{
                DB::rollback();
            }
        } catch (\Exception $e) {
            DB::rollback();
            Log::error($e);
            $response = $this->notification('error');
            $response = $this->notificationAll('error', $e->getMessage());
            return response()->json($response,500);
        }
    }

    public function exams($id)
    {
        $exams = Exam::where('course_id', $id)->get();
        return $exams;
    }

    public function grading($id)
    {
        $gradings = Grade::where('exam_id', $id)
        ->with(['user', 'course'])
        ->get();
        
        return $gradings;
    }
}
