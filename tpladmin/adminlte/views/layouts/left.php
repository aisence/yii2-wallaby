<?php
use yii\bootstrap\Nav;
use kartik\widgets\SideNav;
use yii\helpers\Url;

?>
<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p><?=\Yii::t('app','李晓明')?></p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->


      <!--  Nav::widget(
            [
                'encodeLabels' => false,
                'options' => ['class' => 'sidebar-menu'],
                'items' => [
                    '<li class="header">'.\Yii::t("app","我的菜单").'</li>',
                    ['label' => '<i class="fa fa-file-code-o"></i><span>'.\Yii::t('app','Gii工具').'</span>', 'url' => ['/gii']],
                    ['label' => '<i class="fa fa-dashboard"></i><span>'.\Yii::t('app','调试').'</span>', 'url' => ['/debug']],
                    [
                        'label' => '<i class="glyphicon glyphicon-lock"></i><span>Sing in</span>', //for basic
                        'url' => ['/site/login'],
                        'visible' =>Yii::$app->user->isGuest
                    ],
                ],
            ]
        );-->


        <?php

        $type = SideNav::TYPE_INFO;
        $item = [];
        echo SideNav::widget([
            'type' => $type ,
            'encodeLabels' => false,
            'heading' => false,
            'items' => [
                // Important: you need to specify url as 'controller/action',
                // not just as 'controller' even if default action is used.
                ['label' => \Yii::t('app','会员管理'), 'icon' => 'home', 'url' => Url::to(['/site/home', 'type'=>$type]), 'active' => ($item == 'home')],
                ['label' => \Yii::t('app','认证管理'), 'icon' => 'book', 'items' => [
                    ['label' => 'New Arrivals', 'url' => Url::to(['/site/new-arrivals', 'type'=>$type]), 'active' => ($item == 'new-arrivals')],
                    ['label' => 'Most Popular', 'url' => Url::to(['/site/most-popular', 'type'=>$type]), 'active' => ($item == 'most-popular')],
                    ['label' => 'Read Online', 'icon' => 'cloud', 'items' => [
                        ['label' => 'Online 1', 'url' => Url::to(['/site/online-1', 'type'=>$type]), 'active' => ($item == 'online-1')],
                        ['label' => 'Online 2', 'url' => Url::to(['/site/online-2', 'type'=>$type]), 'active' => ($item == 'online-2')]
                    ]],
                ]],
                ['label' =>  \Yii::t('app','内容管理'), 'icon' => 'tags', 'items' => [
                    ['label' => 'Fiction', 'url' => Url::to(['/site/fiction', 'type'=>$type]), 'active' => ($item == 'fiction')],
                    ['label' => 'Historical', 'url' => Url::to(['/site/historical', 'type'=>$type]), 'active' => ($item == 'historical')],
                    ['label' => 'Announcements', 'icon' => 'bullhorn', 'items' => [
                        ['label' => 'Event 1', 'url' => Url::to(['/site/event-1', 'type'=>$type]), 'active' => ($item == 'event-1')],
                        ['label' => 'Event 2', 'url' => Url::to(['/site/event-2', 'type'=>$type]), 'active' => ($item == 'event-2')]
                    ]],
                ]],
                ['label' => '菜单管理', 'icon' => 'user', 'url' => Url::to(['/site/profile', 'type'=>$type])],
                ['label' => \Yii::t('app','开发工具'), 'icon' => 'wrench', 'items' =>[
                    ['label' => 'Gii', 'url' => ['/gii'], 'active' => ($item == 'gii')],
                    ['label' => \Yii::t('app','调试'), 'url' => ['/debug'], 'active' => ($item == 'debug')],
                ]],
            ],
        ]);
        ?>
       <!-- <ul class="sidebar-menu">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-share"></i> <span>Same tools</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?/*= \yii\helpers\Url::to(['/gii']) */?>"><span class="fa fa-file-code-o"></span> Gii</a>
                    </li>
                    <li><a href="<?/*= \yii\helpers\Url::to(['/debug']) */?>"><span class="fa fa-dashboard"></span><?/*= \Yii::t('app','调试')*/?></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-circle-o"></i> Level One <i class="fa fa-angle-left pull-right"></i></a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-circle-o"></i> Level Two <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>-->

    </section>

</aside>
