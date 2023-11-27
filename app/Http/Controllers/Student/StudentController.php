<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Exam;
use App\Models\ExamSubmission;
use App\Models\Program;
use App\Models\System\Attachment;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use App\Traits\Admin\LayoutTrait;
use App\Traits\Admin\UploadFileTrait;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class StudentController extends Controller
{
    use LayoutTrait;
    use UploadFileTrait;

    public $settings = [
        'model' =>  '\\App\\Models\\ExamSubmission',
        'caption' =>  "ExamSubmission",
        'xFolder' =>  "Admin/Pages/Student/ShowExam",
        'indexRoute' =>  "/admin/exam",
        'storageName' =>  "exam",
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

    public function __construct(){
        $this->middleware('gen-auth');
        $this->defaultModel = $this->settings['model'];
        $this->isReltionship = $this->settings['isReltionship'];
        $this->relationName = $this->settings['relationName'];
        $this->paginateRelation = $this->settings['paginateRelation'];
        $this->setup['statuses'] = $this->defaultModel::options('status');
        $this->setup['tableName'] = $this->defaultModel::getTableName();
        $this->def_constructor();
    }
    public function dashboard(){

        $user = User::where('id', '=', Auth::user()->id)->first();
        if ($user->hasRole('student')) {

            $courses = Course::where('status', 2)->get();
            $programs = Program::where('status', 2)->get();
            $exams = Exam::where('status', 2)->get();

            return Inertia::render('Admin/Pages/StudentDashboard', [
                'role' => 'student',
                'coursesCount' => count($courses),
                'programsCount' => count($programs),
                'examsCount' => count($exams),
                'courses' => $courses,
                'exams' => $exams,
                'programs' => $programs,
            ]);
        }
    }

    public function show($uuid){
        
        $course = Course::where('uuid', $uuid)
        ->with(['program'])
        ->first();
        $model = 'courses';
       // $model = ucfirst($tableId); // Converts 'courses' to 'Course'

        // Use dynamic relationship
        $attachments = Attachment::where('table_id', $model)
            ->where('record_id', $course->uuid)
           // ->with('attachable') // Eager load the related model (Course in this example)
            ->get();
        return Inertia::render('Admin/Pages/Student/ShowCourse', [
            'attachments' => $attachments,
            'course' => $course,
        ]);
    }

    public function showExam($uuid){
        
        $exam = Exam::where('uuid', $uuid)
        ->with(['course', 'grading'])
        // ->where('user_id', Auth::user()->id)
        ->first();
        $model = 'exams';
       // $model = ucfirst($tableId); // Converts 'courses' to 'Course'

        // Use dynamic relationship
        $attachments = Attachment::where('table_id', $model)
            ->where('record_id', $exam->uuid)
           // ->with('attachable') // Eager load the related model (Course in this example)
            ->get();
        return Inertia::render('Admin/Pages/Student/ShowExam', [
            'attachments' => $attachments,
            'exam' => $exam,
        ]);
    }

    public function submitExam(REQUEST $request)
    {
        
        $this->validate($request, [
            'exam' => 'required',
            'title' => 'required',
            'exam_path.*' => 'nullable|array',
            'exam_path.*' => 'file|mimes:pdf,doc,docx',
            
        ]);
        ini_set('max_execution_time', 300); //300 seconds = 5 minutes
        DB::beginTransaction();
        try {
            $this->pKey = $request->uuid;

            $record = [
                'exam_id' => $request->exam,
                'user_id' => Auth::user()->id,
                'status' => 2,
            ];

            if($this->pKey == null){
                $record['created_by'] = Auth::user()->email;
            }else{
                $record['updated_by'] = Auth::user()->email;
            }
            $submission = ExamSubmission::updateOrCreate(["uuid" => $this->pKey], $record);
            $record2 = [];

            // if($request->hasFile('exam_path')){
                foreach($request->file('exam_path') as $file) {
                    $fileName = $this->generateFileName($file);
                    $record2['attachment'] = $fileName;

                    $record2 = [
                        'filename' => $fileName,
                        'description' =>$request->title.'_'. Auth::user()->email .' - ' . $fileName,
                        'table_id' => 'exam_submissions',
                        'record_id' => $submission->uuid,
                        'storageName' => $this->settings['storageName2'].'.attachments',
                    ];
                    $record2['created_by'] = Auth::user()->email;

                    Attachment::create($record2);
                    $fileData = ['file' => $file,'fileName' => $fileName, 'storageName' => $this->settings['storageName2'].'\\attachments','prevFile' => null];
                    // Log::info($fileData);
                    if(!$this->uploadFile($fileData)){
                        $this->isCommit = false;
                    }
                }
                
                
            // }
            // Log::info('commited');
            DB::Commit();
        } catch (\Exception $e) {
            DB::rollback();
            Log::error($e);
            $response = $this->notification('error');
            $response = $this->notificationAll('error', $e->getMessage());
            return response()->json($response,500);
        }
    }
}
