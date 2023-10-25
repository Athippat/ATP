<?PHP
$id = (isset($_GET['id']) ? $id = $_GET['id'] : $id = null);
if($id == null){
?>
<div class="page-content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-8">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="inputPassword2" class="mr-2">Search: </label>
                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search...">
                                    </div>
                                    <div class="form-group mx-sm-3">
                                        <label for="status-select" class="mr-2">Sort By: </label>
                                        <select class="custom-select" id="status-select">
                                            <option selected="">All</option>
                                            <option value="1">Name</option>
                                            <option value="2">Type</option>
                                            <option value="3">Most</option>
                                            <option value="4">Least</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4">
                                <div class="text-lg-right mt-3 mt-lg-0">
                                    <button class="btn btn-success" data-toggle="modal" data-target="#addMaterial"><i class="mdi mdi-plus-circle mr-1"></i> Create New Material</button>

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="addMaterial" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle">Create New Material</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-xl-6">
                                                            <input type="file" class="dropify" data-height="250" />
                                                        </div> <!-- end col -->
                                                        <div class="col-xl-6">
                                                            <div class="form-group">
                                                                <label for="unit">Name</label>
                                                                <input type="text" id="unit" class="form-control" placeholder="Ex. Pork, Meat, Coke, ...">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="unit">Unit</label>
                                                                <select class="form-control mb-3">
                                                                    <option value="0">- Select Unit -</option>
                                                                    <option value="1">kg</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="unit">Type</label>
                                                                <select class="form-control mb-3">
                                                                    <option value="0">- Select Type -</option>
                                                                    <option value="1">Meat</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-success">Create</button>
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
        $stmt = $pdo->query('SELECT * FROM type');
        $types = $stmt->fetchAll();
        ?>

        <div class="row">
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=1">
                    <div class="card bg-danger">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1 text-white">Pork</h5>
                            <p class="text-white font-size-13">1 KG left</p>
                            <p class="card-text">
                                <small class="text-white">(Recommend 400 KG)</small>
                            </p>
                        </div>
                    </div> <!-- end card-->
                </a>
            </div> <!-- end col-->
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=2">
                    <div class="card bg-danger">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1 text-white">Meat</h5>
                            <p class="text-white font-size-13">3 G left</p>
                            <p class="card-text">
                                <small class="text-white">(Recommend 800 KG)</small>
                            </p>
                        </div>
                    </div> <!-- end card-->
                </a>
            </div> <!-- end col-->
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=3">
                    <div class="card bg-warning">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1 text-white">Sugar</h5>
                            <p class="text-white font-size-13">4 KG left</p>
                            <p class="card-text">
                                <small class="text-white">(Recommend 10 KG)</small>
                            </p>
                        </div>
                    </div> <!-- end card-->
                </a>
            </div> <!-- end col-->
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=4">
                    <div class="card bg-warning">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1 text-white">Oil</h5>
                            <p class="text-white font-size-13">20 Bottle left</p>
                            <p class="card-text">
                                <small class="text-white">(Recommend 200 Bottle)</small>
                            </p>
                        </div>
                    </div> <!-- end card-->
                </a>
            </div> <!-- end col-->
            <?PHP for ($i=5; $i <= 12; $i++) {?>
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=<?PHP echo $i?>">
                    <div class="card">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1">Pork</h5>
                            <p class="text-muted font-size-13">50 KG</p>
                        </div>
                    </div> <!-- end card-->
                </a>
            </div> <!-- end col-->
            <?PHP }?>
        </div>
        <!-- end row-->

        <div class="row">
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
        </div>
        <!-- end row-->
    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->


<?PHP }else{?>
<div class="page-content">
    <div class="container-fluid">
        <div class="row mb-4">
            <div class="col-xl-6">
                <input type="file" class="dropify" data-height="250" data-default-file="assets/images/team/team-1.jpg" >
            </div> <!-- end col -->
            <div class="col-xl-6">
                <div class="form-group">
                    <label>Quantity</label>
                    <div class="input-group">
                        <input type="number" class="form-control" placeholder="Enter your Quantity">
                        <div class="input-group-append">
                            <button class="btn btn-dark" type="button">KG</button>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Price / Unit</label>
                    <div class="input-group">
                        <input type="number" class="form-control" placeholder="Enter your Price / Unit">
                        <div class="input-group-append">
                            <button class="btn btn-dark" type="button">Baht / KG</button>
                        </div>
                    </div>
                </div>

                <button class="btn btn-success">Add</button>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <table id="basic-datatable" class="table dt-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>Quantity</th>
                                    <th>Balance</th>
                                    <th>Price/Unit</th>
                                    <th>Date Added</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <tr>
                                    <td>20 KG</td>
                                    <td>4.6 KG</td>
                                    <td>160 Baht</td>
                                    <td>18 October 2023 03:10:58</td>
                                    <td>
                                        <button class="btn btn-warning text-white"><i class="mdi mdi-pencil"></i></button>
                                        <button class="btn btn-danger"><i class="mdi mdi-trash-can"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div> <!-- end card body-->
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>
        <!-- end row-->
    </div>
</div>
<?PHP }?>