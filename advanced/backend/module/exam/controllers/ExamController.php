<?php

namespace backend\module\exam\controllers;

use backend\module\home\controllers\UserController;
use yii\web\Controller;
use yii\common\models\Exam;
use yii\common\models\Examtail;
use yii\common\models\Chooseq;
use yii\common\models\Fillq;
use yii\common\models\Programq;
use yii\common\models\User;
use yii\web\Response;
use yii\web\Request;
use yii\db\Query;

/**
 * Default controller for the `exam` module
 */
class ExamController extends Controller
{

    public function actionQueryid($id)
    {
//        $request =\Yii::$app->request;
//        $id = $request->post('id');
        $query = (new Query())
            ->select('username')
            ->from('user')
            ->where(['id'=>$id])
            ->one();
        return array("data"=>$query,"msg"=>"id为：".$id."用户信息");
    }
    public function actionTest()
    {
        $id=5;
        $queryChooseList = (new Query())
            ->select('qid')
            ->from('examtail')
            ->where(['exid'=>$id])
            ->andWhere(['qtypeid'=>1])
            ->andWhere(['exstatus'=>1])
            ->all();
        $ChooseList = array();
        for($i=0;$i<count($queryChooseList);$i++)
        {
            $ChooseList[$i] = (new Query())
                ->select('*')
                ->from('chooseq')
                ->where(['cqid'=>$queryChooseList[$i]])
                ->andWhere(['cqstatus'=>1])
                ->one();
        }
        return array("data"=>[$queryChooseList,$ChooseList],"msg"=>"s");

    }

    /*
     * 预览试卷
     */
    public function actionView()
    {
        $request = \Yii::$app->request;
        $id = $request->post('id');
        $query = (new Query())
            ->select("*")
            ->from('exam')
            ->where(['exid'=>$id])
            ->andWhere(['exstatus'=>1])
            ->one();
        $exname = $query['exname'];
        $auth = \backend\module\home\controllers\UserController::Queryid($query['auth']);
        $createTime = $query['createtime'];
        $queryChooseList = (new Query())
            ->select('qid')
            ->from('examtail')
            ->where(['exid'=>$id])
            ->andWhere(['qtypeid'=>1])
            ->andWhere(['exstatus'=>1])
            ->all();
        $ChooseList = array();
        for($i=0;$i<count($queryChooseList);$i++)
        {
            $ChooseList[$i] = (new Query())
                ->select('*')
                ->from('chooseq')
                ->where(['cqid'=>$queryChooseList[$i]])
                ->andWhere(['cqstatus'=>1])
                ->one();
        }
        $queryFillList = (new Query())
            ->select('qid')
            ->from('examtail')
            ->where(['exid'=>$id])
            ->andWhere(['qtypeid'=>2])
            ->andWhere(['exstatus'=>1])
            ->all();
        $FillList = array();
        for($i=0;$i<count($queryFillList);$i++)
        {
            $FillList[$i] = (new Query())
                ->select('*')
                ->from('fillq')
                ->where(['fqid'=>$queryFillList[$i]])
                ->andWhere(['fqstatus'=>1])
                ->one();
        }
        $queryProgramList = (new Query())
            ->select('qid')
            ->from('examtail')
            ->where(['exid'=>$id])
            ->andWhere(['qtypeid'=>3])
            ->andWhere(['exstatus'=>1])
            ->all();
        $ProgramList = array();
        for($i=0;$i<count($queryProgramList);$i++)
        {
            $ProgramList[$i] = (new Query())
                ->select('*')
                ->from('programq')
                ->where(['pqid'=>$queryProgramList[$i]])
                ->andWhere(['pqstatus'=>1])
                ->one();
        }


        return array("data"=>[$exname,$auth,$createTime,$ChooseList,$FillList,$ProgramList],"msg"=>"预览试卷");
    }
}