<?php
/**
 * Created by PhpStorm.
 * User: qmh
 * Date: 2019-09-18
 * Time: 10:17
 */

namespace Qmh\SolrEngile;


use Illuminate\Config\Repository;
use Illuminate\Session\SessionManager;

class SolrEngile
{
    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var array
     */
    protected $notifications = [];

    /**
     * Toastr constructor.
     * @param SessionManager $session
     * @param Repository $config
     */
    public function __construct( Repository $config)
    {
        $this->config = $config;
        $this->install();

    }

    /**
     * 安装solr
     * @author: qmh
     * @Time: 2019-09-18   15:42
     */
    public function install(){
        $url    = $this->config->get('url','/usr/local/search');
        $project=$this->config->get('project_name','engile');
        fclose(fopen('./web.txt','w'));
        shell_exec("./install.sh $project $url   >> ./web.txt");
        echo "安装启动完成";
    }

    /**
     * 配置搜索引擎分词 数据库
     * @author: qmh
     * @Time: 2019-09-18   15:42
     */
    public function configuration(){

    }




}
