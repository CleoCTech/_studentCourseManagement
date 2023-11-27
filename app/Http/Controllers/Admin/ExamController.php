<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\System\Attachment;
use Illuminate\Http\Request;
use App\Traits\Admin\LayoutTrait;
use App\Traits\Admin\UploadFileTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class ExamController extends Controller
{
    use LayoutTrait;
    use UploadFileTrait;

    public $settings = [
        'model' =>  '\\App\\Models\\Exam',
        'caption' =>  "Exam",
        'xFolder' =>  "Admin/Pages/Exams",
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
        $this->middleware('admin-auth');
        $this->defaultModel = $this->settings['model'];
        $this->isReltionship = $this->settings['isReltionship'];
        $this->relationName = $this->settings['relationName'];
        $this->paginateRelation = $this->settings['paginateRelation'];
        $this->setup['statuses'] = $this->defaultModel::options('status');
        $this->setup['tableName'] = $this->defaultModel::getTableName();
        $this->def_constructor();

    }
    public function index(){
        $this->def_index();
        return Inertia::render($this->settings['xFolder'].'/Index',$this->viewData);
    }
    
    public function create(){
        $this->def_create();
        $courses = Course::all();
        $this->viewData['courses'] = $courses;
        return Inertia::render($this->settings['xFolder'].'/CreateEdit',$this->viewData);
    }

    public function store(REQUEST $request){
        $this->validate($request, [
            'code' => 'required',
            'name' => 'required',
            'course' => 'required',
            'exam_type' => 'required',
            'max_score' => 'required',
            'exam_path.*' => 'nullable|array',
            'exam_path.*' => 'file|mimes:pdf,doc,docx',
            // 'exam_path.*' => 'nullable',
            // 'exam_path.*' => 'required|file|mimes:pdf,doc,docx',
        ]);
        
        ini_set('max_execution_time', 300); //300 seconds = 5 minutes
        DB::beginTransaction();
        try{
            $this->pKey = $request->uuid;
            $record = [
                'name' => $request->name,
                'code' => $request->code,
                'description' => $request->description,
                'exam_type' => $request->exam_type,
                'course_id' => $request->course,
                'max_score' => $request->max_score,
                'exam_path.*' => $request->exam_path,
                'status' => 2,
            ];
            
            
            if($this->pKey == null){
                $record['created_by'] = Auth::user()->email;
            }else{
                $record['updated_by'] = Auth::user()->email;
            }
            $exam = $this->defaultModel::updateOrCreate(["uuid" => $this->pKey], $record);
            $record2 = [];

            // if($request->hasFile('exam_path')){
                foreach($request->file('exam_path') as $file) {
                    $fileName = $this->generateFileName($file);
                    $record2['attachment'] = $fileName;

                    $record2 = [
                        'filename' => $fileName,
                        'description' => $request->name .' - ' . $fileName,
                        'table_id' => 'exams',
                        'record_id' => $exam->uuid,
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
                
                DB::Commit();
            // }
            

            
        }catch(\Exception $e){
            DB::rollback();
            Log::error($e);
            $response = $this->notification('error');
            $response = $this->notificationAll('error', $e->getMessage());
            return response()->json($response,500);
        }
    }
    public function show($uuid){
        $this->def_show($uuid);
        return Inertia::render($this->settings['xFolder'].'/Show',$this->viewData);
    }
    public function edit($uuid){
        $this->def_edit($uuid);
        if($this->viewData['cardData']['status'] == 3){
            $this->viewData['cardData']['publish_time2'] = $this->viewData['cardData']['publish_time']->format('Y-m-d\TH:i');
        }
        $courses = Course::all();
        $this->viewData['courses'] = $courses;
        return Inertia::render($this->settings['xFolder'].'/CreateEdit',$this->viewData);
    }
    public function destroy($uuid){
        $user = $this->defaultModel::where('uuid',$uuid)->first();
        $user->delete();
        $response = $this->notification('deleteSuccess');
        return response()->json($response,200);
    }
    public function report($name){
        $this->defReport();
        $this->viewData['name'] = $name;
        $this->viewData['fileName'] = 'destinations-report.pdf';
        $this->viewData['dataItems'][0]['relationships'] = 'solutions';
        $this->viewData['dataItems'][1] = [
            'model' => 'App\\Models\\Solution',
            'columns' => $this->defaultModel::getTableColumns('solutions'),
            'caption' => 'Solutions Dataset',
        ];
        return $this->viewData;
    }
}
