<?php
/**
 * Created by PhpStorm.
 * User: qmh
 * Date: 2019-09-18
 * Time: 11:09
 */

namespace Qmh\SolrEngile\Facades;


use Illuminate\Support\Facades\Facade;

class SolrEngile extends Facade
{
    protected static function getFacadeAccessor()
    {
        return 'solrengile';
    }
}
