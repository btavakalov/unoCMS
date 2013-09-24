<?php

/**
 * Services are globally registered in this file
 */

use Phalcon\Mvc\Router,
	Phalcon\Mvc\Url,
	Phalcon\DI\FactoryDefault,
	Phalcon\Session\Adapter\Files as SessionAdapter,
    Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;


/**
 * Read configuration
 */
$config = new \Phalcon\Config\Adapter\Ini(__DIR__ . '/../common/config.ini');

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new FactoryDefault();

/**
 * Registering a router
 */
$di['router'] = function() {

	$router = new Router();

	$router->setDefaultModule("structure");
	$router->setDefaultNamespace("Unocms\Structure\Controllers");

	return $router;
};

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di['url'] = function() {
	$url = new Url;
	$url->setBaseUri('/');
	return $url;
};

/**
 * Start the session the first time some component request the session service
 */
$di['session'] = function() {
	$session = new SessionAdapter();
	$session->start();
	return $session;
};

/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di['db'] = function() use ($config) {
    return new DbAdapter(array(
        "host"      => $config->database->host,
        "username"  => $config->database->username,
        "password"  => $config->database->password,
        "dbname"    => $config->database->name
    ));
};