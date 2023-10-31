<div class="page-content">
    <div class="container-fluid">

        <div class="row mb-3">
            <div class="col-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-lg-right mt-3 mt-lg-0">
                            <button class="btn btn-success" data-toggle="modal" data-target="#addType"><i class="mdi mdi-plus-circle mr-1"></i> Create New Type</button>

                            <!-- Modal -->
                            <div class="modal fade text-left" id="addType" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalCenterTitle">Create New Type</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form id="typeForm" method="post">
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="type">Type</label>
                                                    <input type="text" id="type" name="type" class="form-control" placeholder="Ex. Water, Meat, Vegetable, ...">
                                                </div>
                                                <div class="form-group">
                                                    <label for="colorChoice">Choose type color:</label>
                                                    <input type="hidden" id="colorChoice" name="colorChoice" value=""> <!-- Hidden input to store selected color value -->
                                                    <div class="color-picker mt-2 text-center">
                                                        <div class="btn color-option mb-2" data-color="#c70039" style="background-color: #c70039;"></div>
                                                        <div class="btn color-option mb-2" data-color="#ff5733" style="background-color: #ff5733;"></div>
                                                        <div class="btn color-option mb-2" data-color="#ff8d1a" style="background-color: #ff8d1a;"></div>
                                                        <div class="btn color-option mb-2" data-color="#ffc300" style="background-color: #ffc300;"></div>
                                                        <div class="btn color-option mb-2" data-color="#eddd53" style="background-color: #eddd53;"></div>
                                                        <div class="btn color-option mb-2" data-color="#add45c" style="background-color: #add45c;"></div>
                                                        <div class="btn color-option mb-2" data-color="#57c785" style="background-color: #57c785;"></div>
                                                        <div class="btn color-option mb-2" data-color="#00baad" style="background-color: #00baad;"></div>
                                                        <div class="btn color-option mb-2" data-color="#2a7b9b" style="background-color: #2a7b9b;"></div>
                                                        <div class="btn color-option mb-2" data-color="#3d3d6b" style="background-color: #3d3d6b;"></div>
                                                        <div class="btn color-option mb-2" data-color="#511849" style="background-color: #511849;"></div>
                                                        <div class="btn color-option mb-2" data-color="#900c3f" style="background-color: #900c3f;"></div>
                                                        <!-- Add more color options as needed -->
                                                    </div>
                                                </div>

                                                <script>
                                                    document.addEventListener('DOMContentLoaded', function() {
                                                        const colorOptions = document.querySelectorAll('.color-option');

                                                        colorOptions.forEach(option => {
                                                            option.addEventListener('click', function() {
                                                                let selectedColor = this.getAttribute('data-color');
                                                                document.getElementById('colorChoice').value = selectedColor;

                                                                // For visual feedback: Add 'selected' class to clicked button and remove from others
                                                                colorOptions.forEach(opt => opt.classList.remove('selected'));
                                                                this.classList.add('selected');
                                                            });
                                                        });
                                                    });
                                                </script>

                                                <style>
                                                    .color-option {
                                                        width: 40px;
                                                        height: 40px;
                                                        border: none;
                                                        margin-right: 10px;
                                                        border-radius: 50%;
                                                        cursor: pointer;
                                                        transition: transform 0.3s;
                                                    }

                                                    .color-option.selected {
                                                        transform: scale(1.1);
                                                    }
                                                </style>

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
        $stmt = $pdo->query('SELECT * FROM type');
        $types = $stmt->fetchAll();
        ?>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <table id="basic-datatable" class="table dt-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Type</th>
                                    <th>Color</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <?PHP foreach ($types as $type) {?>
                                <tr>
                                    <td><?PHP echo $type['id']?></td>
                                    <td><?PHP echo $type['type']?></td>
                                    <td style="background-color: <?PHP echo $type['color']?>;"></td>
                                    <td>
                                        <button class="btn btn-warning text-white" data-toggle="modal" data-target="#editType_<?PHP echo $type["id"]?>"><i class="mdi mdi-pencil"></i></button>
                                        <button class="btn btn-danger" data-toggle="modal" data-target="#deleteType_<?PHP echo $type["id"]?>"><i class="mdi mdi-trash-can"></i></button>
                                    </td>
                                </tr>

                                <!-- Modal -->
                                <div class="modal fade text-left" id="editType_<?PHP echo $type['id']?>" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Edit type id <span class="text-warning">#<?PHP echo $type["id"]?></span></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form id="updateTypeForm_<?PHP echo $type['id']?>" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                    <label for="type">Type</label>
                                                    <input type="text" id="type" name="type" class="form-control" placeholder="Ex. Water, Meat, Vegetable, ..." required value="<?PHP echo $type['type']?>">
                                                    <input type="number" name="id" class="d-none" value="<?PHP echo $type['id']?>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Color</label>
                                                    <input type="text" id="hexa-colorpicker" name="color" class="form-control colorpicker-element" value="<?PHP echo $type["color"]?>">
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
                                <div class="modal fade text-left" id="deleteType_<?PHP echo $type['id']?>" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body text-center">
                                                    Do your really want to delete
                                                    <br><br>
                                                    <h2 class="text-warning"><?PHP echo $type['type'];?></h2>
                                                </div>
                                                <form id="deleteTypeForm_<?PHP echo $type['id']?>" method="post">
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
    $('#typeForm').submit(function(e) {
        e.preventDefault();

        let formData = $(this).serialize();

        $.ajax({
            type: "POST",
            url: "./databases/rawMaterial/type/add.php",
            data: formData,
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

<?PHP foreach ($types as $type) {?>
<script>
    $("#deleteTypeForm_<?PHP echo $type['id']?>").on('submit', function(e) {
        e.preventDefault();

        let formData = $(this).serialize();

        $.ajax({
            url: './databases/rawMaterial/type/delete.php?id=<?PHP echo $type["id"]?>',
            type: 'POST',
            data: formData,
            dataType: 'json',
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
    $("#updateTypeForm_<?PHP echo $type['id']?>").on('submit', function(e) {
        e.preventDefault();

        let formData = $(this).serialize();

        $.ajax({
            url: './databases/rawMaterial/type/edit.php',
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
