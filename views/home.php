<div class="page-content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-4 col-xl-7"></div>
            <div class="col-md-6 col-xl-3">
                <div class="form-group">
                    <input type="number" id="sale" name="sale" class="form-control" placeholder="Enter your sales" value="20000">
                </div>
            </div>
            <div class="col-md-2 col-xl-2">
                <button class="btn btn-success w-100">Enter</button>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="text-uppercase font-size-12 text-muted mb-3">Cost</h6>
                                <span class="h3 mb-0 text-warning"> ฿ 16,500.00 </span>
                            </div>
                            <!-- <div class="col-auto">
                                <span class="badge badge-soft-success">+7.5%</span>
                            </div> -->
                        </div> <!-- end row -->

                        <!-- <div id="sparkline1" class="mt-3"></div> -->
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->
            
            <div class="col-lg-6 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="text-uppercase font-size-12 text-muted mb-3">Leftover</h6>
                                <span class="h3 mb-0 text-danger"> ฿ --- </span>
                            </div>
                            <!-- <div class="col-auto">
                                <span class="badge badge-soft-danger">-24.5%</span>
                            </div> -->
                        </div> <!-- end row -->

                        <!-- <div id="sparkline2" class="mt-3"></div> -->
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->

            <div class="col-lg-6 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="text-uppercase font-size-12 text-muted mb-3">Salary</h6>
                                <span class="h3 mb-0 text-danger"> ฿ 2,400.00 </span>
                            </div>
                            <!-- <div class="col-auto">
                                <span class="badge badge-soft-success">+3.5%</span>
                            </div> -->
                        </div> <!-- end row -->

                        <!-- <div id="sparkline3" class="mt-3"></div> -->
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->

            <div class="col-lg-6 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="text-uppercase font-size-12 text-muted mb-3">Profit</h6>
                                <span class="h3 mb-0 text-success"> ฿ 6,100.00 </span>
                            </div>
                            <!-- <div class="col-auto">
                                <span class="badge badge-soft-success">+53.5%</span>
                            </div> -->
                        </div> <!-- end row -->

                        <!-- <div id="sparkline4" class="mt-3"></div> -->
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->
        </div>
        <!-- end row-->

        <div class="row">
            <!-- <div class="col-xl-4 col-lg-5">
                <div class="card">
                    <div class="card-body">
        
                        <h4 class="card-title">All Time Best Products</h4>
                        <p class="card-subtitle mb-4">From date of 1st Jan 2019 to continue</p>

                        <div id="morris-donut-example" class="morris-chart"></div>
        
                    </div>
                </div>

            </div> -->

            <!-- <div class="col-xl-8 col-lg-7">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Sales Analytics</h4>
                        <p class="card-subtitle mb-4">From date of 1st Jan 2019 to continue</p>

                        <div id="morris-bar-example" class="morris-chart"></div>

                    </div>
                </div>
            </div> -->
        </div>
        <!-- end row-->

        <div class="row mb-1">
            <div class="col-12 text-right">
                <a href="./index.php?page=menu" class="text-secondary"><u>View All</u></a>
            </div>
        </div>

        <?PHP
        $stmt = $pdo->query('SELECT * FROM menu');
        $menus = $stmt->fetchAll();
        ?>

        <div class="row">
            <!-- Out of Material -->
            <?PHP $checkCol = 0;?>
            <?PHP foreach ($menus as $menu) {?>
                <?PHP
                $stmt = $pdo->prepare("SELECT * FROM menu_material WHERE menu_id=:menu_id");
                $stmt->execute([':menu_id' => $menu['id']]);
                $menu_material = $stmt->fetchAll();

                $countRawMaterial = 0;

                foreach ($menu_material as $MM) { 
                    $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
                    $stmt->execute([':id' => $MM['material_id']]);
                    $material = $stmt->fetchAll();

                    $stmt = $pdo->prepare("SELECT * FROM material_quantity WHERE material_id=:material_id");
                    $stmt->execute([':material_id' => $material[0]['id']]);
                    $material_quantity = $stmt->fetchAll();

                    $balance = 0;

                    foreach($material_quantity as $mq){
                        $balance += $mq["balance"];
                    }

                    if($balance - $MM["quantity"] < 0){
                        $countRawMaterial++;
                    }
                }
                ?>

                <?PHP if($countRawMaterial > 0){?>
                    <div class="col-xl-3 col-lg-6 text-center">
                        <div class="card">
                            <div style="aspect-ratio: 16/9; overflow: hidden; display: flex; justify-content: center; align-items: center;">
                                <?PHP if($menu['image'] == null){?>
                                    <img height="100%" src="https://fakeimg.pl/1920x1080/?text=<?PHP echo $menu['name']?>">
                                <?PHP }else{?>
                                    <img height="100%" src="./pictures/menu/<?PHP echo $menu['id'] . '.' . $menu['image']?>">
                                <?PHP }?>
                            </div>
                            <div class="card-body">
                                <h5 class="mb-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 100%;" title="<?PHP echo $menu['name']?>"><?PHP echo $menu["name"]?></h5>
                                <p class="text-danger font-size-13">Out of raw material</p>

                                <div class="row justify-content-center">
                                    <a href="./index.php?page=menu&id=<?PHP echo $menu['id']?>" class="btn btn-warning text-white mx-1"><i class="mdi mdi-pencil"></i></a>
                                    <a href="./index.php?page=rawMaterial_manage" class="btn btn-success"><i class="mdi mdi-silverware-variant"></i> Add Raw Material</a>
                                </div>
                            </div>
                        </div> <!-- end card-->
                    </div> <!-- end col-->
                <?PHP }?>
            <?PHP
                $checkCol++;
                if($checkCol >= 8){
                    break;
                }
            }?>
        </div>

        <?PHP
        $stmt = $pdo->query('SELECT * FROM material_leftover');
        $material_leftover = $stmt->fetchAll();
        ?>

        <div class="row">
            <div class="col-xl-8">
                <div class="card">
                    <div class="card-body">
        
                        <h4 class="card-title">Raw Material Leftover</h4>
                        
                        <div class="table-responsive">
                            <table id="basic-datatable" class="table dt-responsive table-centered table-striped table-nowrap">
                                <thead>
                                    <tr>
                                        <th>Raw Material</th>
                                        <th>Quantity</th>
                                        <th>Price / Unit</th>
                                        <th>Date</th>
                                        <th>Leftover By</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <?PHP foreach ($material_leftover as $ML){?>
                                    <tr>
                                        <td class="table-user">
                                            <img src="./pictures/rawMaterial/<?PHP echo $ML['material_id'] . '.' . $ML['material_image']?>" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                            <a href="javascript:void(0);" class="text-body font-weight-semibold"><?PHP echo $ML['name']?></a>
                                        </td>
                                        <td><?PHP echo $ML["quantity"] . " " . $ML["unit"]?></td>
                                        <td>฿ <?PHP echo $ML["price"]?></td>
                                        <td>
                                            <?PHP echo changeDateTime($ML["regDate"])?>
                                        </td>
                                        <td><?PHP echo $ML["leftoverBy"]?></td>
                                    </tr>
                                    <?PHP }?>
                                    
                                </tbody>
                            </table>
                        </div>

                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col -->
            
            <div class="col-xl-4">
                <div class="card">
                    <div class="card-body">
        
                        <h4 class="card-title">Employee Check In</h4>
                        <!-- <p class="card-subtitle mb-4">Transaction period from 21 July to 25 Aug</p> -->
                        
                        <div class="table-responsive">
                            <table class="table table-borderless table-hover table-centered table-nowrap mb-0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal text-danger">Check-Out</h5>
                                            <span class="text-muted font-size-12">31 October 2021 21:01:52</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">
                                                <img src="https://fakeimg.pl/512x512" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                                Athip
                                            </h5>
                                            <span class="text-muted font-size-12">Athippat Chirawongnathiporn</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">Employee</h5>
                                            <span class="text-muted font-size-12">Permission</span>
                                        </td>
                                    </tr>

                                    <tr>
                                    <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal text-danger">Check-Out</h5>
                                            <span class="text-muted font-size-12">31 October 2021 20:59:38</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">
                                                <img src="https://fakeimg.pl/512x512" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                                Plume
                                            </h5>
                                            <span class="text-muted font-size-12">Pongsakorn Sommapee</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">Employee</h5>
                                            <span class="text-muted font-size-12">Permission</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal text-success">Check-In</h5>
                                            <span class="text-muted font-size-12">31 October 2021 09:13:52</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">
                                                <img src="https://fakeimg.pl/512x512" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                                Aomsin
                                            </h5>
                                            <span class="text-muted font-size-12">Suwijak Tepasukalak</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">Employee</h5>
                                            <span class="text-muted font-size-12">Permission</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal text-success">Check-In</h5>
                                            <span class="text-muted font-size-12">31 October 2021 09:13:52</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">
                                                <img src="https://fakeimg.pl/512x512" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                                Plume
                                            </h5>
                                            <span class="text-muted font-size-12">Pongsakorn Sommapee</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">Employee</h5>
                                            <span class="text-muted font-size-12">Permission</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal text-success">Check-In</h5>
                                            <span class="text-muted font-size-12">31 October 2021 09:13:52</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">
                                                <img src="https://fakeimg.pl/512x512" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                                Athip
                                            </h5>
                                            <span class="text-muted font-size-12">Athippat Chirawongnathiporn</span>
                                        </td>
                                        <td>
                                            <h5 class="font-size-15 mb-1 font-weight-normal">Employee</h5>
                                            <span class="text-muted font-size-12">Permission</span>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col -->
        </div>
        <!-- end row-->

    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
