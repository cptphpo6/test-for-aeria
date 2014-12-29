<?php 
$destLink = mysqli_connect('immdevdb.ciguidpxtyhi.eu-west-1.rds.amazonaws.com', 'AeriaDBUser', 'B3r1!n(0g4me$');
if (!$destLink) {
	die('Not connected : ' . mysqli_error());
}
$dest_db_selected = mysqli_select_db('ImmDev', $destLink);
if (mysqli_connect_errno()) {
	die ('Can\'t use foo : ' . mysqli_error());
}else{
	$sql ="select * from results limit 0,100";
	$resultSet = mysql_query($sql);
	$count=mysql_num_rows($resultSet);
	if($count > 0){
?>
	<table cellspacing="2" cellpadding="2" width="80%" border="1">
		<tr style="font-weight:bold;">
			<td>ID</td>
			<td>Code</td>
			<td>Extension</td>
			<td>Gender</td>
			<td>Tube</td>
		</tr>
	   
	<?php }
	while($data = mysql_fetch_array($resultSet))
	{
	?>	
		 <tr>
		<td><?php echo $data['id'];?></td>
		<td><?php echo $data['well'];?></td>
		<td><?php echo $data['ruid'];?></td>
		<td><?php echo $data['gender_status'];?></td>
		<td><?php echo $data['tube_id'];?></td>
		</tr>
	<?php 
	}
	?>
	
	</table>
<?php
 }
?>