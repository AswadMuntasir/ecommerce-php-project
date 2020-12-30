<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php include '../classes/DeliveryBoy.php'; ?>
<?php include_once '../helpers/Format.php'; ?>
<?php 
$pd = new DeliveryBoy();
$fm = new Format();
 ?>
 <?php 
if (isset($_GET['dels'])) {
    $id = preg_replace('/[^-a-zA-Z0-9_]/', '', $_GET['dels']);
    $delS = $pd->delDById($id);
}
 ?>

<div class="grid_10">
    <div class="box round first grid">
        <h2>Post List</h2>
        <?php 
                if (isset($delS)) {
                    echo $delS;
                }
                 ?>
        <div class="block">  
            <table class="data display datatable" id="example">
			<thead>
				<tr>
					<th>Sl</th>
					<th>Name</th>
					<th>Address</th>
					<th>City</th>
					<th>Zip</th>
					<th>Email</th>
					<th>Country</th>
					<th>Phone</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php 
                $gets = $pd->getDeliveryBoyData();
                if ($gets) {
                    $i=0;
                    while ($result = $gets->fetch_assoc()) {
                        $i++; ?>
				<tr class="odd gradeX">
					<td><?php echo $i; ?></td>
					<td><?php echo $result['dboyName']; ?></td>
					<td><?php echo $result['dboyAddress']; ?></td>
					<td><?php echo $result['dboyCity']; ?></td>
					<td><?php echo $result['dboyZip']; ?></td>
					<td><?php echo $result['dboyEmail']; ?></td>
					<td><?php echo $result['dboyCountry']; ?></td>
					td><?php echo $result['dboyPhone']; ?></td>
					<td>
						<?php 
                        
                        if ($result['type']==0) {
                            echo "Featured";
                        } else {
                            echo "General";
                        } ?>
							
						</td>					
					<td><a href="dboyedit.php?sid=<?php echo $result['dboyId']; ?>">Edit</a> || <a onclick="return confirm('Are you sure to delete this?')" href="?dels=<?php echo $result['dboyId']; ?>">Delete</a></td>
				</tr>
				<?php
                    }
                } ?>
			</tbody>
		</table>

       </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();
        $('.datatable').dataTable();
		setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>
