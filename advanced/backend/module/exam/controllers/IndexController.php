<?php

namespace backend\module\exam\controllers;

use phpDocumentor\Reflection\Types\This;
use yii\db\Exception;
use yii\web\Controller;
use yii\common\models\Exam;
use yii\common\models\Examtail;
use yii\common\models\Chooseq;
use yii\common\models\Fillq;
use yii\common\models\Programq;
use yii\web\Response;
use yii\web\Request;
use yii\db\Query;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use yii\filters\Cors;
use yii\behaviors\TimestampBehavior;

/**
 * Default controller for the `exam` module
 */
class IndexController extends Controller
{
    public function actionIndex()
    {
        return "exam-index"; // TODO: Change the autogenerated stub
    }
    /*
     * 查看全部的试卷
     * 标志：flag
     * 1：有效试卷
     * 2：已删除试卷
     * 3：所有试卷
     * 4:模糊查找
     */
    public function actionQueryexam()
    {
        $request=\Yii::$app->request;
        $flag = $request->post("flag");
        if($flag==1)
        {
            $query = (new Query())
                ->select('*')
                ->from('exam')
                ->where(['exstatus'=>1])
                ->all();
            return array("data"=>$query,"msg"=>"有效试卷");
        }
        else if($flag==2)
        {
            $query = (new Query())
                ->select('*')
                ->from('exam')
                ->where(['exstatus'=>0])
                ->all();
            return array("data"=>$query,"msg"=>"已删除试卷");
        }
        else if($flag==3)
        {
            $query = (new Query())
                ->select('*')
                ->from('exam')
                ->all();
            return array("data"=>$query,"msg"=>"全部试卷");
        }
        else if($flag==4)
        {
            $name = $request->post('name');
            $query = (new Query())
                ->select("*")
                ->from('exam')
                ->where(['or',
                    ['like', 'exname', $name],
                    ['like', 'exid', $name],])
                ->all();
            return array("data"=>$query,"msg"=>$name."全部试卷");
        }
        else{
            return array("data"=>$flag,"msg"=>"输入错误");
        }

    }
    /*
     * 生成随机数函数:要求生成的随机数不重复
     */
    public function Rand($min,$max,$num)
    {
        $count =0;
        $result = array();
        while ($count<$num)
        {
            $result[]=mt_rand($min,$max);
            $result =array_flip(array_flip($result));
            $count = count($result);
        }
        //打乱数组，重新赋予数组的新的下标
        shuffle($result);
        return $result;
    }
    public function actionTest()
    {
        $min = 1;
        $max = 20;
        $num =15;
        $arr = $this->Rand($min,$max,$num);
        return array("data"=>$arr,"msg"=>"产生的随机数");
    }
    /*
     * 组卷：
     * 两种形式：自动组卷（随机）、人为选择组卷
     * 选择标志：flag
     * 1:自动组卷：设定选择题、填空题、程序题数量n,在各自题库中随机抽取组合成为一套试卷；
     * 参数：试卷名（exname）、选择题数（numc）、填空题数（numf）、程序题数（nump）
     * 2:人为选择组卷
     *     k     1：(预览)：手工选择各自题库中的题目组成一套试卷；
     *           2:加入试卷中
     *
     * 3:创建试卷（重新创建新的试卷，不同于从题库中选择。）
     *          该部分需要的前端获取用户添加的题目的详细信息，将用户添加的试卷信息添加至数据库中
     *          插入的数据有：题库信息、试卷信息
     *
     * 参数：
     */
    public function actionAddexam()
    {

        $request = \Yii::$app->request;
        $flag = $request->post("flag");
        $id = (new Query())
            ->select("*")
            ->from("exam")
            ->max('exid');
        $id = $id+1;
        $exname = $request->post('exname');
        if($flag==1) {
            //自动组卷
            /*
             * 自动组卷中设定选择题，填空题，程序题的个数
             */
            $numc = $request->post('numc');
            $numf = $request->post('numf');
            $nump = $request->post('nump');
            $numj = $request->post('numj');
            $numcm = $request->post('numcm');

            //不考虑题库中题数目不足的情况
            //所有的题库表的id都是从1开始的，从中产生随机数id，插入到数据库中；
            $min = 1;
            //选择选择题
            $queryc = (new Query())
                ->select("*")
                ->from("chooseq")
                ->max('cqid');
            $arrc = $this->Rand($min, $queryc, $numc);

            for ($x = 0; $x < $numc; ) {
                $err = (new Query())
                    ->select('*')
                    ->from('chooseq')
                    ->where(['cqid'=>$arrc[$x]])
                    ->one();
                if($err['cqstatus']==1)
                {
//                    失效试题
                    $insertc = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $arrc[$x], 'qtypeid' => 1, 'exstatus' => 1))->execute();
                    $x =$x+1;
                }
                else{
                    $x = $x;
                }
            }
            $queryf = (new Query())
                ->select("*")
                ->from("fillq")
                ->max('fqid');
            $arrf = $this->Rand($min, $queryf, $numf);
            for ($x = 0; $x < $numf; ) {
                $err = (new Query())
                    ->select('*')
                    ->from('fillq')
                    ->where(['fqid'=>$arrf[$x]])
                    ->one();
                if($err['fqstatus']==1)
                {
                    $insertf= \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $arrf[$x], 'qtypeid' => 2, 'exstatus' => 1))->execute();
                    $x =$x+1;
                }
                else{
                    $x = $x;
                }
            }
            $queryp = (new Query())
                ->select("*")
                ->from("program")
                ->max('pqid');
            $arrp = $this->Rand($min, $queryp, $nump);
            for ($x = 0; $x < $nump; ) {
                $err = (new Query())
                    ->select('*')
                    ->from('program')
                    ->where(['pqid'=>$arrp[$x]])
                    ->one();
                if($err['pqstatus']==1)
                {
                    $insertp = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $arrp[$x], 'qtypeid' => 3, 'exstatus' => 1))->execute();
                    $x =$x+1;
                }
                else{
                    $x = $x;
                }
            }
            $queryj = (new Query())
                ->select("*")
                ->from("judge")
                ->max('jqid');
            $arrj = $this->Rand($min, $queryj, $numj);
            for ($x = 0; $x < $numj; ) {
                $err = (new Query())
                    ->select('*')
                    ->from('judge')
                    ->where(['jqid'=>$arrj[$x]])
                    ->one();
                if($err['jqstatus']==1)
                {
                    $insertj = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $arrj[$x], 'qtypeid' => 5, 'exstatus' => 1))->execute();
                    $x =$x+1;
                }
                else{
                    $x = $x;
                }
            }
            $querycm = (new Query())
                ->select("*")
                ->from("choosem")
                ->max('mqid');
            $arrcm = $this->Rand($min, $querycm, $numcm);
            for ($x = 0; $x < $numcm; ) {
                $err = (new Query())
                    ->select('*')
                    ->from('choosem')
                    ->where(['mqid'=>$arrcm[$x]])
                    ->one();
                if($err['mqstatus']==1)
                {
                    $insertcm = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $arrcm[$x], 'qtypeid' => 4, 'exstatus' => 1))->execute();
                    $x =$x+1;
                }
                else{
                    $x = $x;
                }
            }
            $auth = $request->post('auth');
            $createtime = date('Y-m-d H:i:s',time());
            $insertexam = \Yii::$app->db->createCommand()->insert('exam',array('exid'=>$id,'exname'=>$exname,
                'createtime'=>$createtime,'auth'=>$auth,'exstatus'=>1))->execute();
            if($insertexam)
            {
                return array("data"=>$insertexam,"msg"=>"自动组卷成功");
            }
            else
            {
                return array("data"=>$insertexam,"msg"=>"该试卷已创建");
            }
        }
        else if($flag==2)
        {
            //手动组卷
            $k = $request->post('k');
            if($k==1){
//                预览问卷
                $chooseList = $request->post('chooseList');
                $choose = array();
                for($i=0;$i<count($chooseList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('chooseq')
                        ->where(['cqid'=>$chooseList[$i]])
                        ->one();
                    array_push($choose,$c);
                }
                $fillList= $request->post('fillList');
                $fill = array();
                for($i=0;$i<count($fillList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('fillq')
                        ->where(['fqid'=>(int)$fillList[$i]])
                        ->one();
                    array_push($fill,$c);
                }
                $judgeList= $request->post('judgeList');
                $judge = array();
                for($i=0;$i<count($judgeList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('judge')
                        ->where(['jqid'=>(int)$judgeList[$i]])
                        ->one();
                    array_push($judge,$c);
                }
                $choosemList= $request->post('choosemList');
                $choosem = array();
                for($i=0;$i<count($choosemList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('choosem')
                        ->where(['mqid'=>(int)$choosemList[$i]])
                        ->one();
                    array_push($choosem,$c);
                }
                $programList= $request->post('programList');
                $program = array();
                for($i=0;$i<count($programList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('program')
                        ->where(['pqid'=>(int)$programList[$i]])
                        ->one();
                    array_push($program,$c);
                }
                return array("data"=>[$choose,$fill,$judge,$choosem,$program],"msg"=>"预览试卷");
            }
            else if($k==2)
            {
//                $id = (new Query())
//                    ->select("*")
//                    ->from("exam")
//                    ->max('exid');
//                $id = $id+1;
//                添加至问卷中
                $chooseList = $request->post('chooseList');
                for($i=0;$i<count($chooseList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('chooseq')
                        ->where(['cqid'=>$chooseList[$i]])
                        ->one();
                    $insertc = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $c['cqid'], 'qtypeid' => 1, 'exstatus' => 1))->execute();
                }
                $fillList= $request->post('fillList');
                for($i=0;$i<count($fillList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('fillq')
                        ->where(['fqid'=>(int)$fillList[$i]])
                        ->one();
                    $insertf = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $c['fqid'], 'qtypeid' => 2, 'exstatus' => 1))->execute();
                }
                $judgeList= $request->post('judgeList');
                for($i=0;$i<count($judgeList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('judge')
                        ->where(['jqid'=>(int)$judgeList[$i]])
                        ->one();
                    $insertj = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $c['jqid'], 'qtypeid' => 5, 'exstatus' => 1))->execute();
                }
                $choosemList= $request->post('choosemList');
                for($i=0;$i<count($choosemList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('choosem')
                        ->where(['mqid'=>(int)$choosemList[$i]])
                        ->one();
                    $insertm = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $c['mqid'], 'qtypeid' => 4, 'exstatus' => 1))->execute();
                }
                $programList= $request->post('programList');
                for($i=0;$i<count($programList);$i++)
                {
                    $c = (new Query())
                        ->select("*")
                        ->from('program')
                        ->where(['pqid'=>(int)$programList[$i]])
                        ->one();
                    $insertp = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                        'qid' => $c['pqid'], 'qtypeid' => 3, 'exstatus' => 1))->execute();
                }
                $exname = $request->post('exname');
                $auth = $request->post('auth');
                $createtime = date('Y-m-d H:i:s',time());
                $insertexam = \Yii::$app->db->createCommand()->insert('exam',array('exid'=>$id,'exname'=>$exname,
                    'createtime'=>$createtime,'auth'=>$auth,'exstatus'=>1))->execute();
                if($insertexam)
                {
                    return array("data"=>[$insertexam],"msg"=>"完成问卷试卷");
                }
                else{
                    return array("data"=>[],"msg"=>"出现错误");
                }


            }
            else{
                return array("data"=>$k,"msg"=>"输入错误");
            }

        }
        else if($flag==3)
        {
//            创建试卷
            $id = (new Query())
                ->select("*")
                ->from("exam")
                ->max('exid');
            $id = $id+1;
            $Clist = $request->post('CList');
            $Flist = $request->post('FList');
            $Plist = $request->post('PList');
            $CMlist =$request->post('CMList');
            $Jlist = $request->post('JList');
//            return array("data"=>[$Clist,$Flist],"msg"=>"测试");
            for($i=0;$i<count($Clist);$i++)
            {
                $op = $Clist[$i]['cqcho1'].'---'.$Clist[$i]['cqcho2'].'---'.$Clist[$i]['cqcho3'].'---'.$Clist[$i]['cqcho4'];
                $idc = (new Query())
                    ->select("*")
                    ->from('chooseq')
                    ->max('cqid');
                $idc = $idc+1;
                $updatec = \Yii::$app->db->createCommand()->insert('chooseq',
                    array('cqid'=>$idc,'cqitem'=>$Clist[$i]['cqitem'],'cqcho'=>$op,'cqans'=>$Clist[$i]['cqans'],'cqtail'=>$Clist[$i]['cqtail'],
                        'cqrem'=>$Clist[$i]['cqrem'],'cqstatus'=>1))->execute();
                $insertc = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                    'qid' => $idc, 'qtypeid' => 1, 'exstatus' => 1))->execute();

            }
            for($i=0;$i<count($Flist);$i++)
            {
                $idf = (new Query())
                    ->select("*")
                    ->from('fillq')
                    ->max('fqid');
                $idf = $idf + 1;
                $updatef = \Yii::$app->db->createCommand()->insert('fillq',
                    array('fqid' => $idf, 'fqitem' => $Flist[$i]['fitem'], 'fqans' => $Flist[$i]['fans'], 'fqtail' => $Flist[$i]['ftail'],
                        'fqrem' => $Flist[$i]['frem'], 'fqstatus' => 1))->execute();
                $insertf = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                    'qid' => $idf, 'qtypeid' => 2, 'exstatus' => 1))->execute();
            }
            for($i=0;$i<count($Jlist);$i++)
            {
                $idj = (new Query())
                    ->select("*")
                    ->from('judge')
                    ->max('jqid');
                $idj = $idj + 1;
                $updatej = \Yii::$app->db->createCommand()->insert('judge',
                    array('jqid' => $idj, 'jqitem' => $Jlist[$i]['jitem'], 'jqans' => $Jlist[$i]['jans'], 'jqtail' => $Jlist[$i]['jtail'],
                        'jqrem' => $Jlist[$i]['jrem'], 'jqstatus' => 1))->execute();
                $insertj = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                    'qid' => $idj, 'qtypeid' => 5, 'exstatus' => 1))->execute();

            }
            for($i=0;$i<count($Plist);$i++)
            {
                $idp = (new Query())
                    ->select("*")
                    ->from('program')
                    ->max('pqid');
                $idp = $idp + 1;
                $updatep = \Yii::$app->db->createCommand()->insert('program',
                    array('pqid' => $idp, 'pqitem' => $Plist[$i]['pitem'], 'pqans' => $Plist[$i]['pans'], 'pqtail' => $Plist[$i]['ptail'],
                        'pqrem' => $Plist[$i]['prem'], 'pqstatus' => 1))->execute();
                $insertp = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                    'qid' => $idp, 'qtypeid' => 3, 'exstatus' => 1))->execute();
            }
            for($i=0;$i<count($CMlist);$i++)
            {
                $idcm = (new Query())
                    ->select("*")
                    ->from('choosem')
                    ->max('mqid');
                $idcm = $idcm+1;
                $op = $CMlist[$i]['mcho1'].'---'.$CMlist[$i]['mcho2'].'---'.$CMlist[$i]['mcho3'].'---'.$CMlist[$i]['mcho4'];
                $updatecm = \Yii::$app->db->createCommand()->insert('choosem',
                    array('mqid'=>$idcm,'mqitem'=>$CMlist[$i]['mitem'],'mqcho'=>$op,'mqans'=>$CMlist[$i]['mans'],'mqtail'=>$CMlist[$i]['mtail'],
                        'mqrem'=>$CMlist[$i]['mrem'],'mqstatus'=>1))->execute();
                $insertm = \Yii::$app->db->createCommand()->insert('examtail', array('exid' => $id,
                    'qid' => $idcm, 'qtypeid' => 4, 'exstatus' => 1))->execute();

            }
            $auth = $request->post('auth');
            $createtime = date('Y-m-d H:i:s',time());
            $insertexam = \Yii::$app->db->createCommand()->insert('exam',array('exid'=>$id,'exname'=>$exname,
                'createtime'=>$createtime,'auth'=>$auth,'exstatus'=>1))->execute();
            if($insertexam)
            {
                return array("data"=>[$insertexam],"msg"=>"完成创建试卷");
            }
            else{
                return array("data"=>[],"msg"=>"出现错误");
            }
        }
        else{
            return array("data"=>$flag,"msg"=>"输入错误");
        }

    }
    /*
     * 删除试卷：永久删除和暂时删除
     * 选择标志：flag
     * 1:暂时删除
     * 2：永久删除
     * 试卷删除时需要更新试卷表和试卷详情表
     * 参数：试卷id(exid)
     */
    public function actionDeleteexam()
    {
        $request = \Yii::$app->request;
        $flag = $request->post('flag');
        $id =$request->post('exid');
        if($flag==1)
        {
            $query = (new Query())
                ->select("*")
                ->from('exam')
                ->where(['exid'=>$id])
                ->andWhere(['exstatus'=>1])
                ->one();
            //暂时删除
            if($query)
            {
                $update1 = \Yii::$app->db->createCommand()->update('exam',['exstatus'=>0],"exid={$id}")->execute();
                $update2 = \Yii::$app->db->createCommand()->update('examtail',['exstatus'=>0],"exid={$id}")->execute();
                if($update1 and $update2)
                {
                    return array("data"=>[$flag,$update1,$update2],"msg"=>"删除成功");
                }
                else{
                    return array("data"=>[$flag,$update1,$update2],"msg"=>"已删除，请勿重复删除");
                }
            }
            else{
                return array("data"=>$flag,"msg"=>"未找到该试卷");
            }
        }
        else if($flag==2)
        {
            $query = (new Query())
                ->select("*")
                ->from('exam')
                ->where(['exid'=>$id])
                ->andWhere(['exstatus'=>0])
                ->one();
            //永久删除
            if($query)
            {
                $delete1 = \Yii::$app->db->createCommand()->delete('exam',['exid'=>$id])->execute();
                $delete2 = \Yii::$app->db->createCommand()->delete('examtail',['exid'=>$id])->execute();
                if($delete1 and $delete2)
                {
                    return array("data"=>[$flag,$delete1,$delete2],"msg"=>"完全删除成功");
                }
                else{
                    return array("data"=>[$flag,$delete1,$delete2],"msg"=>"已完全删除，请勿重复删除");
                }
            }
            else{
                return array("data"=>$flag,"msg"=>"未找到该试卷");
            }
        }
        else{
            return array("data"=>$flag,"msg"=>"输入错误");
        }
    }
    /*
     * 修改
     * 1：状态
     */
    public function actionChangestatus(){
        $request = \Yii::$app->request;
        $id = $request->post('exid');
        $query = (new Query())
            ->select("*")
            ->from('exam')
            ->where(['exid'=>$id])
            ->andWhere(['exstatus'=>0])
            ->one();
        if($query)
        {
            $update2 = \Yii::$app->db->createCommand()->update('examtail',['exstatus'=>1],"exid={$id}")->execute();
            $update1 = \Yii::$app->db->createCommand()->update('exam',['exstatus'=>1],"exid={$id}")->execute();
            return array("data"=>$query,"msg"=>"修改状态成功");
        }
        else{
            return array("data"=>$id,"msg"=>"未找到");
        }
    }
    /*
     * 修改试卷：添加或者删除试卷中的某一个题目
     * 标志：flag
     * 1:添加一个题目到某个试卷
     * 2：从某试卷中删除一道题目
     */
    public function actionChangeexam()
    {

    }

}