<?php
//web/index.php
require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();

require __DIR__.'/../app/config/dev.php';
require __DIR__.'/../app/app.php';


$app['dao.champion']->saveAllChamp();
echo "Champions save done !!";
$app['dao.champion']->saveFreeChamp();
echo "Free champions save done !!";
$app['dao.champion']->saveCurrentVersion();
echo "LOL version save done !!";
return 'DONE';

$app->run();


