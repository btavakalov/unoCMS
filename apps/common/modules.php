<?php

/**
 * Register application modules
 */
$application->registerModules(array(
	'structure' => array(
		'className' => 'Unocms\Structure\Module',
		'path' => __DIR__ . '/../structure/Module.php'
	),
	'shop' => array(
		'className' => 'Unocms\Shop\Module',
		'path' => __DIR__ . '/../shop/Module.php'
	),
));

$application->setDefaultModule("structure");