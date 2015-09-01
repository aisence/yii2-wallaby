<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/8/27
 * Time: 15:46
 */

class Admin extends ActiveRecord implements IdentityInterface {
    public static function tableName()
    {
        return '{{%admin}}';
    }
}