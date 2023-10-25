<div class="page-content">
    <div class="container-fluid">

        <div class="row mb-3">
            <div class="col-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-lg-right mt-3 mt-lg-0">
                            <button class="btn btn-success" data-toggle="modal" data-target="#addUnit"><i class="mdi mdi-plus-circle mr-1"></i> Create New Unit</button>

                            <!-- Modal -->
                            <div class="modal fade text-left" id="addUnit" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Create New Unit</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form id="unitForm" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="unit">Unit</label>
                                                        <input type="text" id="unitInput" name="unit" class="form-control" placeholder="Ex. kg, g, price, ..." required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-success">Add</button>
                                                </div>
                                            </form>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- end col-->
                </div> <!-- end row -->
            </div><!-- end col-->
        </div>
        <!-- end row --> 

        <?PHP
        $stmt = $pdo->query('SELECT * FROM unit');
        $units = $stmt->fetchAll();
        ?>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <table id="basic-datatable" class="table dt-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Unit</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <?PHP foreach ($units as $unit) {?>
                                <tr>
                                    <td><?PHP echo $unit["id"]?></td>
                                    <td><?PHP echo $unit["unit"]?></td>
                                    <td>
                                        <button class="btn btn-warning text-white" data-toggle="modal" data-target="#editUnit_<?PHP echo $unit["id"]?>"><i class="mdi mdi-pencil"></i></button>
                                        <button class="btn btn-danger" data-toggle="modal" data-target="#deleteUnit_<?PHP echo $unit["id"]?>"><i class="mdi mdi-trash-can"></i></button>
                                    </td>
                                </tr>

                                <!-- Modal -->
                                <div class="modal fade text-left" id="editUnit_<?PHP echo $unit['id']?>" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Edit unit id <span class="text-warning">#<?PHP echo $unit["id"]?></span></h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form id="updateUnitForm_<?PHP echo $unit['id']?>" method="post">
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label for="unit">Unit</label>
                                                            <input type="text" name="unit" class="form-control" placeholder="Ex. kg, g, price, ..." required value="<?PHP echo $unit['unit']?>">
                                                            <input type="number" name="id" class="d-none" placeholder="Enter ID to update" value="<?PHP echo $unit['id']?>">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-warning text-white">Edit</button>
                                                    </div>
                                                </form>
                                            </div>
                                    </div>
                                </div>
                                
                                <!-- Modal -->
                                <div class="modal fade text-left" id="deleteUnit_<?PHP echo $unit['id']?>" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body text-center">
                                                    Do your really want to delete
                                                    <br><br>
                                                    <h2 class="text-warning"><?PHP echo $unit['unit'];?></h2>
                                                </div>
                                                <form id="deleteUnitForm_<?PHP echo $unit['id']?>" method="post">
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-danger">Delete</button>
                                                    </div>
                                                </form>
                                            </div>
                                    </div>
                                </div>
                                <?PHP }?>
                            </tbody>
                        </table>

                    </div> <!-- end card body-->
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>
        <!-- end row-->

    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->

<script>
    $('#unitForm').submit(function(e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "./databases/rawMaterial/unit/add.php",
            data: { unit: $('#unitInput').val() },
            success: function(response) {
                if(response.status === "success") {
                    Swal.fire({
                        type: 'success',
                        title: 'Success',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
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
                });
            }
        });
    });
</script>

<?PHP foreach ($units as $unit) {?>
<script>
    $("#deleteUnitForm_<?PHP echo $unit['id']?>").on('submit', function(e) {
        e.preventDefault();

        let formData = $(this).serialize();

        $.ajax({
            url: './databases/rawMaterial/unit/delete.php?id=<?PHP echo $unit["id"]?>',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function(response) {
                console.log(response);
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
                });
            }
        });
    });
</script>

<script>
    $("#updateUnitForm_<?PHP echo $unit['id']?>").on('submit', function(e) {
        e.preventDefault();

        let formData = $(this).serialize();

        $.ajax({
            url: './databases/rawMaterial/unit/edit.php',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function(response) {
                console.log(response);
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
                });
            }
        });
    });
</script>
<?PHP }?>
