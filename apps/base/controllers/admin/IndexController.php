<?php

namespace Unocms\Base\Controllers\Admin;

/**
 * @RoutePrefix("/admin")
 */
class IndexController extends ControllerBase
{

    /**
     * @Get("(/?)")
     */
    public function indexAction()
    {
        die('index');
    }

    /**
     * @Get("/edit/{id:[0-9]+}(/?)", name="edit-robot")
     */
    public function editAction($id)
    {
        var_dump($id);
        die('edit');
    }

}