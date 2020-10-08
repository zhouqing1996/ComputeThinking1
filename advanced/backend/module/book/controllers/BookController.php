<?php
namespace backend\module\book\controllers;

use yii\db\Exception;
use yii\web\Controller;
use yii\common\models\Book;
use yii\web\Response;
use yii\web\Request;
use yii\db\Query;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use yii\filters\Cors;
use yii\behaviors\TimestampBehavior;

/**
 * Default controller for the `book` module
 */
class BookController extends Controller
{
    public function actionIndex()
    {
        return "book"; // TODO: Change the autogenerated stub
    }
    /*
    *查找所有图书
     */
    public function actionQuery()
    {
        $query = (new Query())
            ->select('*')
            ->from('book')
            ->Where(['status'=> 1])
            ->all();
        return array("data"=>$query,"msg"=>"所有图书");
    }
    /*
     * 添加图书
     * 其中图书id、图书名、status是必不可少的内容
     * id为关键码，不可重复
     */
    public function actionAddbook()
    {
        $bookid = "1";
        $bookname = "something";
        $publish="人民出版社";
        $author="some";
        $about="something in ss";
        $status=1;
//        $request = \Yii::$app->request;
//        $bookname = $request->post('bookname');
//        $publish = $request->post('publish');
//        $author=$request->post("author");
//        $about=$request->post("about");
//        $bookid = (new Query())
//            ->select('*')
//            ->from('book')
//            ->andWhere(['status' =>1])
//            ->count();
//        $bookid = $bookid +1;
        //如果书名和作者相同判断该图书已经添加过了，不再添加
        $query = (new Query())
            ->select('*')
            ->from('book')
            ->Where(['bookname'=> $bookname])
            ->andWhere(['author'=>$author])
            ->andWhere(['status'=> 1])
            ->one();
        if($query){
            return array("data"=>[$query],"msg"=>"该图书已经添加过了");
        }
        $insertU = \Yii::$app->db->createCommand()->insert('book',array('bookid'=>$bookid,'bookname'=>$bookname,'publish'=>$publish,'author'=>$author,
            'about'=>$about,'status'=>$status))->execute();
        if($insertU)
        {
            return array("data"=>[$bookname,$bookid],"msg"=>"图书添加成功");
        }
        else
        {
            return array("data"=>[$bookname,$bookid],"msg"=>"图书添加失败");
        }
    }
    /*
     * 图书删除，删除分两种：暂时删除的和永久删除
     * 数据库中的数据很多时候不是直接删除，而是将其身份隐藏，是为了数据保持一定的有效期.即为暂时删除，
     */
    public function actionDeletebook()
    {
//        $request=\Yii::$app->request;
//        $bookid=$request->post("bookid");
        $bookid = '1';
        $query = (new Query())
            ->select('*')
            ->from('book')
            ->Where(['bookid'=>$bookid])
            ->andWhere(['status'=>1])
            ->one();
        if($query)
        {
            $updateU = \Yii::$app->db->createCommand()->update('book', ['status' => 0], 'bookid=:bookid',[':bookid'=>$bookid])->execute();
            if($updateU)
            {
                return array("data"=>[$query,$updateU],"msg"=>"该图书已删除");
            }
            else
            {
                return array("data"=>[$query,$updateU],"msg"=>"该图书没有删除成功");
            }
        }
        else{
            return array("data"=>[],"msg"=>"没有找到该图书");
        }
    }
    /*
     * 图书永久删除，在数据库中永久删除
     */
    public function actionDeletebooks()
    {
//        $requests = \Yii::$app->request;
//        $bookids=$requests->post("bookid");
        $bookids = "1";
        $querys = (new Query())
            ->select('*')
            ->from('book')
            ->Where(['bookid'=>$bookids])
//            ->andWhere(['status'=>1])
            ->one();
        if($querys)
        {
            $updateUs = \Yii::$app->db->createCommand()->delete('book',['bookid'=>$bookids])->execute();
            if($updateUs)
            {
                return array("data"=>[$querys,$updateUs],"msg"=>"该图书已永久删除");
            }
            else
            {
                return array("data"=>[$querys,$updateUs],"msg"=>"该图书没有永久删除成功");
            }
        }
        else{
            return array("data"=>[],"msg"=>"没有找到该图书");
        }
    }
    /*
     * 修改图书信息
     */
    public function actionChangebook()
    {
        $bookid = "1";
        $bookname = "aaaasomethings";
        $publish="aaaaa人民出版社s";
        $author="aasomes";
        $about="aasomething in sedcda";
//        $request = \Yii::$app->request;
//        $bookid=$request->post('bookid');
//        $bookname = $request->post('bookname');
//        $publish = $request->post('publish');
//        $author=$request->post("author");
//        $about=$request->post("about");
//        $bookid = (new Query())
//            ->select('*')
//            ->from('book')
//            ->andWhere(['status' =>1])
//            ->count();
//        $bookid = $bookid +1;
        $query = (new Query())
            ->select('*')
            ->from('book')
            ->Where(['bookid'=>$bookid])
            ->andWhere(['status'=>1])
            ->one();
        if($query)
        {
            $updateU = \Yii::$app->db->createCommand()->update('book', ['bookname'=>$bookname,'publish'=>$publish,'author'=>$author,'about'=>$about], "bookid={$bookid}")->execute();
            if($updateU)
            {
                return array("data"=>[$query,$updateU],"msg"=>"该图书修改成功");
            }
            else
            {
                return array("data"=>[$query,$updateU],"msg"=>"该图书已经修改");
            }
        }
        else{
            return array("data"=>[],"msg"=>"没有找到该图书");
        }
    }
}