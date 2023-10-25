 <!-- ========== Left Sidebar Start ========== -->
 <div class="vertical-menu">
    <div data-simplebar class="h-100">
        <!-- LOGO -->
        <div class="navbar-brand-box">
            <a href="./" class="logo">
                <span>
                    <!-- <img src="assets/images/logo-light.png" alt="" height="15"> -->
                </span>
                <i>
                    <!-- <img src="assets/images/logo-small.png" alt="" height="24"> -->
                </i>
            </a>
        </div>

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <!-- Main -->
                <li class="menu-title">Overview</li>

                <li class="<?PHP if($page=='home') echo 'mm-active';?>">
                    <a href="./index.php?page=home" class="<?PHP if($page == 'home') echo 'active';?>"><i class="mdi mdi-view-dashboard"></i><span>Dashboard</span></a>
                </li>

                <!-- Stock -->
                <li class="menu-title">Stock</li>

                <li class="<?PHP if($page=='order') echo 'mm-active';?>">
                    <a href="./index.php?page=order" class="<?PHP if($page == 'order') echo 'active';?>"><i class="mdi mdi-book"></i><span>Order</span></a>
                </li>

                <li 
                    class="
                    <?PHP if($page == "rawMaterial_overview" ||
                    $page == "rawMaterial_manage" ||
                    $page == "rawMaterial_unit" ||
                    $page == "rawMaterial_type"){
                        echo "mm-active";
                    }?>
                    "
                >
                    <a href="javascript: void(0);" class="has-arrow
                    <?PHP if($page == "rawMaterial_overview" ||
                    $page == "rawMaterial_manage" ||
                    $page == "rawMaterial_unit" ||
                    $page == "rawMaterial_type"){
                        echo "mm-active";
                    }?>
                    "><i class="mdi mdi-silverware-variant"></i><span>Raw Material</span></a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="./index.php?page=rawMaterial_manage" class="<?PHP if ($page=='rawMaterial_manage') echo 'active';?>">Manage</a></li>
                        <li><a href="./index.php?page=rawMaterial_unit" class="<?PHP if ($page=='rawMaterial_unit') echo 'active';?>">Unit</a></li>
                        <li><a href="./index.php?page=rawMaterial_type" class="<?PHP if ($page=='rawMaterial_type') echo 'active';?>">Type</a></li>
                    </ul>
                </li>

                <li class="<?PHP if($page=='menu') echo 'mm-active';?>">
                    <a href="./index.php?page=menu" class="<?PHP if($page=='menu') echo 'active';?>"><i class="mdi mdi-book-open-variant"></i><span>Menu</span></a>
                </li>

                <!-- Employee -->
                <li class="menu-title">Employee</li>

                <li class="<?PHP if($page=='employee') echo 'mm-active';?>">
                    <a href="./index.php?page=employee" class="<?PHP if($page=='employee') echo 'active';?>"><i class="mdi mdi-account-multiple"></i><span>Employee</span></a>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow"><i class="feather-map"></i><span>Maps</span></a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="maps-google.html">Google Maps</a></li>
                        <li><a href="maps-vector.html">Vector Maps</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->