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
                                </form>
                            </div>
                            <div class="col-lg-4">
                                <div class="text-lg-right mt-3 mt-lg-0">
                                    <button class="btn btn-success" data-toggle="modal" data-target="#createMenu"><i class="mdi mdi-plus-circle mr-1"></i> Create New Menu</button>

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="createMenu" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle">Create New Menu</h5>
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
                                                                <label for="name">Name</label>
                                                                <input type="text" id="name" class="form-control" placeholder="Ex. Fried rice, Sushi, Soup, ...">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="description">Menu Description</label>
                                                                <textarea class="form-control" id="description" rows="5"></textarea>
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

        <div class="row">
            <div class="col-xl-3 col-lg-6 text-center">
                <div class="card">
                    <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="mb-1">Fried Rice</h5>
                        <p class="text-success font-size-13">Add raw materials</p>

                        <div class="row justify-content-center">
                            <a href="./index.php?page=menu&id=1" class="btn btn-success text-white mx-1"><i class="mdi mdi-plus-circle"></i></a>
                        </div>
                    </div>
                </div> <!-- end card-->
            </div> <!-- end col-->
            <div class="col-xl-3 col-lg-6 text-center">
                <div class="card">
                    <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="mb-1">Soup</h5>
                        <p class="text-danger font-size-13">Out of raw material</p>

                        <div class="row justify-content-center">
                            <a href="./index.php?page=menu&id=2" class="btn btn-warning text-white mx-1"><i class="mdi mdi-pencil"></i></a>
                            <a href="./index.php?page=rawMaterial_manage" class="btn btn-success"><i class="mdi mdi-silverware-variant"></i> Add Raw Material</a>
                        </div>
                    </div>
                </div> <!-- end card-->
            </div> <!-- end col-->
            <div class="col-xl-3 col-lg-6 text-center">
                <div class="card">
                    <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="mb-1">Salmon</h5>
                        <p class="text-danger font-size-13">Out of raw material</p>

                        <div class="row justify-content-center">
                            <a href="./index.php?page=menu&id=3" class="btn btn-warning text-white mx-1"><i class="mdi mdi-pencil"></i></a>
                            <a href="./index.php?page=rawMaterial_manage" class="btn btn-success"><i class="mdi mdi-silverware-variant"></i> Add Raw Material</a>
                        </div>
                    </div>
                </div> <!-- end card-->
            </div> <!-- end col-->
            <?PHP for ($i=4; $i <= 10; $i++) {?>
            <div class="col-xl-3 col-lg-6 text-center">
                <div class="card">
                    <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="mb-1">Pork</h5>
                        <p class="text-muted font-size-13">10 Unit</p>

                        <div class="row justify-content-center">
                        <a href="./index.php?page=menu&id=<?PHP echo $i;?>" class="btn btn-warning text-white mx-1"><i class="mdi mdi-pencil"></i></a>
                    </div>
                    </div>
                </div> <!-- end card-->
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
                    <label for="name">Name</label>
                    <input type="text" id="name" class="form-control" placeholder="Ex. Fried rice, Sushi, Soup, ..." value="Fried Rice">
                </div>
                <div class="form-group">
                    <label for="description">Menu Description</label>
                    <textarea class="form-control" id="description" rows="5"></textarea>
                </div>

                <button class="btn btn-warning text-white"><i class="mdi mdi-pencil"></i> Edit</button>
            </div>
        </div>

        <h1>Raw Material</h1>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <table class="table dt-responsive nowrap text-center">
                            <thead>
                                <tr>
                                    <th>Raw Material</th>
                                    <th>Quantity / Menu</th>
                                    <th>Balance</th>
                                    <th>Status</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <?PHP if($id != 1){?>
                                    <?PHP if($id == 2 || $id == 3){?>
                                    <tr>
                                        <td>Rice</td>
                                        <td>40 g</td>
                                        <td>30 g</td>
                                        <td class="text-danger">Not Enough</td>
                                        <td>
                                            <button class="btn btn-danger"><i class="mdi mdi-trash-can"></i></button>
                                        </td>
                                    </tr>
                                    <?PHP }else{?>
                                    <tr>
                                        <td>Pork</td>
                                        <td>25 kg</td>
                                        <td>400 kg</td>
                                        <td class="text-success">Enough</td>
                                        <td>
                                            <button class="btn btn-danger"><i class="mdi mdi-trash-can"></i></button>
                                        </td>
                                    </tr>
                                    <?PHP }?>
                                <?PHP }?>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <select class="form-control mb-3">
                                                <option value="0">- Select Raw Material -</option>
                                                <option value="1">Pork</option>
                                                <option value="2">Meat</option>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <input type="text" id="number" class="form-control" placeholder="Quantity / Menu">
                                        </div>
                                    </td>
                                    <td>0</td>
                                    <td></td>
                                    <td><button class="btn btn-success"><i class="mdi mdi-plus-circle"></i></button></td>
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