<?php

$loader = new \Phalcon\Loader();

$loader->registerNamespaces(array(
    'Unocms'       => __DIR__ . '/../',
));

$loader->register();