<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/9/9
 * Time: 14:41
 */


return [
    'aliases' => [
        'wallaby' => dirname(__DIR__),
        'extensions' => dirname(dirname(__DIR__)) . '/extensions',
    ],
    'bootstrap' => [
        'wallaby',
    ],
    'modules' => [
        'wallaby' => 'wallaby\Module'
    ],
    'params' => []
];