<?php

/**
 * Register application modules
 */
$application->registerModules(array(
	'base' => array(
		'className' => 'Unocms\Base\Module',
		'path' => __DIR__ . '/../base/Module.php'
	),
));

$application->setDefaultModule('base');