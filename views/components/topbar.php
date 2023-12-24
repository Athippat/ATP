<header id="page-topbar">
    <div class="navbar-header">
        <div class="d-flex align-items-center">
            <button type="button" class="btn btn-sm mr-2 d-lg-none header-item" id="vertical-menu-btn">
                <i class="fa fa-fw fa-bars"></i>
            </button>

            <div class="header-breadcumb">
                <!-- <h6 class="header-pretitle d-none d-md-block">Pages <i class="dripicons-arrow-thin-right"></i> Dashboard</h6> -->
                <h2 class="header-title"><?PHP echo $pageName;?></h2>
            </div>
        </div>
        <div class="d-flex align-items-center">
            
            <!-- <button type="button" class="btn btn-primary d-none d-lg-block ml-2">
                <i class="mdi mdi-pencil-outline mr-1"></i> Create Reports
            </button> -->

            <div class="dropdown d-inline-block ml-2">
                <!-- <button type="button" class="btn header-item noti-icon" id="page-header-notifications-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="mdi mdi-bell-outline"></i>
                    <span class="badge badge-danger badge-pill">6</span>
                </button> -->
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0"
                    aria-labelledby="page-header-notifications-dropdown">
                    <div class="p-3">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="m-0"> Notifications </h6>
                            </div>
                            <div class="col-auto">
                                <a href="#!" class="small"> View All</a>
                            </div>
                        </div>
                    </div>
                    <div data-simplebar style="max-height: 230px;">
                        <a href="" class="text-reset">
                            <div class="media py-2 px-3">
                                <img src="assets/images/users/avatar-2.jpg"
                                    class="mr-3 rounded-circle avatar-xs" alt="user-pic">
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1">Samuel Coverdale</h6>
                                    <p class="font-size-12 mb-1">You have new follower on Instagram</p>
                                    <p class="font-size-12 mb-0 text-muted"><i class="mdi mdi-clock-outline"></i> 2 min ago</p>
                                </div>
                            </div>
                        </a>
                        <a href="" class="text-reset">
                            <div class="media py-2 px-3">
                                <div class="avatar-xs mr-3">
                                    <span class="avatar-title bg-success rounded-circle">
                                        <i class="mdi mdi-cloud-download-outline"></i>
                                    </span>
                                </div>
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1">Download Available !</h6>
                                    <p class="font-size-12 mb-1">Latest version of admin is now available. Please download here.</p>
                                    <p class="font-size-12 mb-0 text-muted"><i class="mdi mdi-clock-outline"></i> 4 hours ago</p>
                                </div>
                            </div>
                        </a>
                        <a href="" class="text-reset">
                            <div class="media py-2 px-3">
                                <img src="assets/images/users/avatar-3.jpg"
                                    class="mr-3 rounded-circle avatar-xs" alt="user-pic">
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1">Victoria Mendis</h6>
                                    <p class="font-size-12 mb-1">Just upgraded to premium account.</p>
                                    <p class="font-size-12 mb-0 text-muted"><i class="mdi mdi-clock-outline"></i> 1 day ago</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="p-2 border-top">
                        <a class="btn btn-sm btn-light btn-block text-center" href="javascript:void(0)">
                            <i class="mdi mdi-arrow-down-circle mr-1"></i> Load More..
                        </a>
                    </div>
                </div>
            </div>

            <div class="dropdown d-inline-block ml-2">
                <button type="button" class="btn header-item" id="page-header-user-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <!-- <img class="rounded-circle header-profile-user" src="assets/images/users/avatar-1.jpg"
                        alt="Header Avatar"> -->
                    <span class="d-none d-sm-inline-block ml-1"><?PHP echo $_SESSION['firstname'];?></span>
                    <i class="mdi mdi-chevron-down d-none d-sm-inline-block"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-right">

                    <!-- <a class="dropdown-item d-flex align-items-center justify-content-between" href="javascript:void(0)">
                        <span>Inbox</span>
                        <span>
                            <span class="badge badge-pill badge-success">3</span>
                        </span>
                    </a> -->
                    <!-- <a class="dropdown-item d-flex align-items-center justify-content-between" href="javascript:void(0)">
                        <span>Profile</span>
                    </a> -->
                    <a class="dropdown-item d-flex align-items-center justify-content-between" href="./databases/logout.php">
                        <span>Log Out</span>
                    </a>
                </div>
            </div>
            
        </div>
    </div>
</header>