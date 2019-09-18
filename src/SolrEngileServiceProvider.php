<?php

namespace Qmh\SolrEngile;

use Illuminate\Support\ServiceProvider;

class SolrEngileServiceProvider extends ServiceProvider
{
    /**
     * 服务提供者加是否延迟加载
     *
     * @val bool
     */
    protected $defer=true;//延迟加载服务


    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        $this->loadViewsFrom(__DIR__.'/views','SolrEngile');//视图目录指定
        $this->publishes([
           __DIR__.'/views'=>base_path('resources/views/vendor/solrengile'),//发布视图目录到resources下
           __DIR__.'/config/solrengile.php'=>config_path('solrengile.php'),//发布配置文件到laravel的config下
        ]);
    }


    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //单例绑定服务
        $this->app->singleton('solrengile',function ($app){
           return new SolrEngile($app['session'],$app['config']);
        });
    }

    public function provides()
    {
        return ['solrengile'];
    }
}
