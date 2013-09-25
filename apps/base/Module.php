<?php

namespace Unocms\Base;

use Phalcon\Loader,
	Phalcon\Mvc\View,
	Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{

	/**
	 * Registers the module auto-loader
	 */
	public function registerAutoloaders()
	{
//		$loader = new Loader();

//		$loader->registerNamespaces(array(
//			'Unocms\Base\Controllers'       => __DIR__ . '/controllers/',
//			'Unocms\Base\Models'            => __DIR__ . '/models/',
//		));

//		$loader->register();
	}

	/**
	 * Registers the module-only services
	 *
	 * @param \Phalcon\DI $di
	 */
	public function registerServices($di)
	{

        /**
         * Read configuration
         */
        $config = new \Phalcon\Config\Adapter\Ini('config.ini');

		/**
		 * Setting up the view component
		 */
		$di['view'] = function() use ($config) {
			$view = new View();
			$view->setViewsDir(__DIR__ . $config->application->viewsDir);
			return $view;
		};

	}

}