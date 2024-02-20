<?php

namespace App\Modules\Settings\Api;

use App\Modules\Settings\Loader\SuperHubLoader;
use App\Modules\Settings\Setting as DashSetting;
use App\Utilities\Utilitie;

class SuperHubApi extends Utilitie
{
    function get()
    {
        if (!DashSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $averageLoadingTime = SuperHubLoader::averageLoadingTime();
        $popularBrowsers = SuperHubLoader::popularBrowsers();
        $popularDevice = SuperHubLoader::popularDevice();
        $popularOperatingSystems = SuperHubLoader::popularOperatingSystems();
        $trafficTypeDistribution = SuperHubLoader::trafficTypeDistribution();
        $last30DaysVisitorCount = SuperHubLoader::last30DaysVisitorCount();

        $membersCount = SuperHubLoader::membersCount();
        $contentCount = SuperHubLoader::contentCount();
        $ordersCount = SuperHubLoader::ordersCount();

        return $this->response(
            200,
            json_encode([
                "averageLoadingTime" => $averageLoadingTime,
                "popularBrowsers" => $popularBrowsers,
                "popularDevice" => $popularDevice,
                "popularOperatingSystems" => $popularOperatingSystems,
                "trafficTypeDistribution" => $trafficTypeDistribution,
                "last30DaysVisitorCount" => $last30DaysVisitorCount,
                "membersCount" => $membersCount,
                "contentCount" => $contentCount,
                "ordersCount" => $ordersCount,
            ])
        );
    }
}
