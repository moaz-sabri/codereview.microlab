<?php

namespace App\Modules\Settings\Loader;

use App\Modules\Offers\Models\OfferModel;
use App\Modules\Projects\Models\ProjectModel;
use App\Modules\Traffic\Models\TrafficModel;
use App\Modules\Traffic\Models\VisitorModel;
use App\Utilities\Utilitie;

class SuperHubLoader extends Utilitie
{
    static function popularOperatingSystems()
    {
        $groupModel = new VisitorModel();
        $groupModel->analysis = [
            "select" => "os, COUNT(uid) AS os_count",
            "group" => "os",
            "order" => "os_count",
            "dir" => "DESC",
        ];

        return $groupModel->getAnalysis();
    }

    static function popularBrowsers()
    {
        $groupModel = new VisitorModel();
        $groupModel->analysis = [
            "select" => "browser, COUNT(uid) AS browser_count",
            "group" => "browser",
            "order" => "browser_count",
            "dir" => "DESC",
        ];

        return $groupModel->getAnalysis();
    }

    static function popularDevice()
    {
        $groupModel = new VisitorModel();
        $groupModel->analysis = [
            "select" => "device, COUNT(uid) AS device_count",
            "group" => "device",
            "order" => "device_count",
            "dir" => "DESC",
        ];

        return $groupModel->getAnalysis();
    }

    static function trafficTypeDistribution()
    {
        $groupModel = new TrafficModel();
        $groupModel->analysis = [
            "select" => " type, COUNT(uid) AS traffic_count",
            "group" => "type",
            "order" => "traffic_count",
            "dir" => "DESC",
        ];

        return $groupModel->getAnalysis();
    }
    
    
    static function averageLoadingTime()
    {
        
        $groupModel = new TrafficModel();
        $groupModel->analysis = [
            "select" => "DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time",
            "where" => "WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()",
            "group" => "visit_date",
            "order" => "visit_date",
            "dir" => "DESC",
        ];
        
        return $groupModel->getAnalysis();
    }
    
    static function last30DaysVisitorCount()
    {
        
        $groupModel = new VisitorModel();
        $groupModel->analysis = [
            "select" => "DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors",
            "where" => "WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()",
            "group" => "visit_date",
            "order" => "visit_date",
            "dir" => "DESC",
        ];

        return $groupModel->getAnalysis();
    }

    static function membersCount()
    {
        $groupModel = new VisitorModel();
        $groupModel->analysis = [
            "select" => "COUNT(DISTINCT ip_address) AS members",
            "order" => "created_at",
            "dir" => "DESC",
        ];

        return $groupModel->getAnalysis();
    }

    static function contentCount()
    {
        $projectModel = new ProjectModel();
        $projectModel->analysis = [
            "select" => " type, COUNT(uid) AS count",
            "group" => "type",
            "order" => "count",
            "dir" => "DESC",
        ];

        return $projectModel->getAnalysis();
    }

    static function ordersCount()
    {
        $projectModel = new OfferModel();
        $projectModel->analysis = [
            "select" => " type, COUNT(uid) AS count",
            "group" => "type",
            "order" => "count",
            "dir" => "DESC",
        ];

        return $projectModel->getAnalysis();
    }
}
