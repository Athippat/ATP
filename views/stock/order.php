<div class="page-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="text-lg-right mt-3 mt-lg-0">
                                    <button class="btn btn-warning text-white" data-toggle="modal" data-target="#historyOrder"><i class="mdi mdi-history mr-1"></i> Order History</button>

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="historyOrder" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle">History</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- <div class="row">
                                                        <div class="col-xl-12">
                                                            <div class="form-group mb-3">
                                                                <label>Date Select</label>
                                                                <input type="text" class="form-control date" id="singledaterange" data-toggle="daterangepicker" data-cancel-class="btn-warning">
                                                            </div>
                                                        </div>
                                                    </div> -->

                                                    <?PHP
                                                    $stmt = $pdo->query('SELECT * FROM history');
                                                    $histories = $stmt->fetchAll();
                                                    ?>

                                                    <div class="row">
                                                        <div class="col-12">
                                                            <table id="basic-datatable" class="table dt-responsive nowrap w-100 text-center">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Picture</th>
                                                                        <th>Menu</th>
                                                                        <th>Serve By</th>
                                                                        <th>DateTime</th>
                                                                    </tr>
                                                                </thead>
                                                            
                                                                <tbody>
                                                                    <?PHP foreach ($histories as $history){?>
                                                                        <tr>
                                                                            <td><img class="card-img-top img-fluid" src="./pictures/menu/<?PHP echo $history["menu_id"] . '.' . $history["menu_image"]?>" alt="Not have images"></td>
                                                                            <td><?PHP echo $history["menu_name"]?></td>
                                                                            <td><?PHP echo $history["serveBy"]?></td>
                                                                            <td><?PHP echo changeDateTime($history["regDate"])?></td>
                                                                        </tr>
                                                                    <?PHP }?>
                                                                </tbody>
                                                            </table>
                                                        </div><!-- end col-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end col-->
                        </div> <!-- end row -->
                    </div>
                </div> <!-- end card-box -->
            </div><!-- end col-->
        </div>
        <!-- end row -->  

        <?PHP
        $stmt = $pdo->query('SELECT * FROM menu');
        $menus = $stmt->fetchAll();
        ?>

        <div class="row">

        <!-- Normal -->
            <?PHP foreach ($menus as $menu) {?>
                <?PHP
                $stmt = $pdo->prepare("SELECT * FROM menu_material WHERE menu_id=:menu_id");
                $stmt->execute([':menu_id' => $menu['id']]);
                $menu_material = $stmt->fetchAll();

                $i = 0;

                $numOfUnit = 0;

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

                    if($i == 0){
                        $numOfUnit = $balance / $MM["quantity"];
                    }else{
                        if(($balance / $MM["quantity"]) < $numOfUnit){
                            $numOfUnit = $balance / $MM["quantity"];
                        }
                    }
                    $i++;
                }
                ?>

                <?PHP if(count($menu_material) > 0 && $countRawMaterial == 0){?>
                    <div class="col-xl-3 col-lg-6 text-center">
                        <div class="card">
                            <?PHP if($menu['image'] == null){?>
                                <img class="card-img-top img-fluid" src="https://fakeimg.pl/1920x1080/?text=<?PHP echo $menu['name']?>">
                            <?PHP }else{?>
                                <img class="card-img-top img-fluid" src="./pictures/menu/<?PHP echo $menu['id'] . '.' . $menu['image']?>">
                            <?PHP }?>
                            <div class="card-body">
                                <h5 class="mb-1"><?PHP echo $menu["name"]?></h5>
                                <p class="text-muted font-size-13"><?PHP echo floor($numOfUnit);?> Unit</p>

                                <div class="row justify-content-center">
                                    <button class="btn btn-success mx-1" id="cfServe_<?PHP echo $menu['id']?>"><i class="mdi mdi-shopping"></i> Serve</button>

                                    <script>
                                        $('#cfServe_<?PHP echo $menu['id']?>').click(function () {
                                            Swal.fire({
                                                title: "Are you sure for this serve?",
                                                type: "warning",
                                                showCancelButton: true,
                                                confirmButtonColor: "#3085d6",
                                                cancelButtonColor: "#d33",
                                                confirmButtonText: "Serve"
                                            }).then(function (result) {
                                                if (result.value) {
                                                    $.ajax({
                                                        url: './databases/order/serve.php?id=<?PHP echo $menu['id']?>',
                                                        type: "POST",
                                                        processData: false,
                                                        contentType: false,
                                                        success: function(response) {
                                                            if(response.status === "success") {
                                                                Swal.fire({
                                                                    type: 'success',
                                                                    title: 'Success',
                                                                    text: response.message,
                                                                    timer: 2000,
                                                                    showConfirmButton: false,
                                                                }).then ( () => {
                                                                    location.reload();
                                                                });
                                                            } else {
                                                                Swal.fire({
                                                                    type: 'error',
                                                                    title: 'Error',
                                                                    text: response.message,
                                                                    timer: 2000,
                                                                    showConfirmButton: false
                                                                }).then ( () => {
                                                                    location.reload();
                                                                });
                                                            }
                                                        },
                                                        error: function() {
                                                            Swal.fire({
                                                                type: 'error',
                                                                title: 'Error',
                                                                text: 'Unexpected error occurred!',
                                                                timer: 2000,
                                                                showConfirmButton: false
                                                            }).then ( () => {
                                                                location.reload();
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                        </div> <!-- end card-->
                    </div> <!-- end col-->
                <?PHP }?>
            <?PHP }?>

            <!-- Out of Material -->
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
                            <?PHP if($menu['image'] == null){?>
                                <img class="card-img-top img-fluid" src="https://fakeimg.pl/1920x1080/?text=<?PHP echo $menu['name']?>">
                            <?PHP }else{?>
                                <img class="card-img-top img-fluid" src="./pictures/menu/<?PHP echo $menu['id'] . '.' . $menu['image']?>">
                            <?PHP }?>
                            <div class="card-body">
                                <h5 class="mb-1"><?PHP echo $menu["name"]?></h5>
                                <p class="text-danger font-size-13">Out of raw material</p>

                                <div class="row justify-content-center">        
                                    <button class="btn btn-success mx-1 disabled"><i class="mdi mdi-shopping"></i> Serve</button>
                                </div>
                            </div>
                        </div> <!-- end card-->
                    </div> <!-- end col-->
                <?PHP }?>
            <?PHP }?>
        </div>
        <!-- end row-->

        <!-- <div class="row">
            <div class="col-12">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item">
                            <a class="page-link" href="javascript: void(0);" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="javascript: void(0);">1</a></li>
                        <li class="page-item"><a class="page-link" href="javascript: void(0);">2</a></li>
                        <li class="page-item"><a class="page-link" href="javascript: void(0);">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: void(0);">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div> -->
        <!-- end row-->
    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->