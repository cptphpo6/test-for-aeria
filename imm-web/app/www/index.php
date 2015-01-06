<?php 
echo "06 January 2015";
echo "cross checked";
//echo "*** Automation By Sathish Again ***";
//echo "*** Commit asked by phone ***";
//echo phpinfo();
$destLink = mysql_connect('immdevdb.ciguidpxtyhi.eu-west-1.rds.amazonaws.com', 'AeriaDBUser', 'B3r1!n(0g4me$');
if (!$destLink) {
	die('Not connected : ' . mysql_error());
}
$dest_db_selected = mysql_select_db('ImmDev', $destLink);
if (!$dest_db_selected) {
	die ('Can\'t use foo : ' . mysql_error());
}else{
	$sql ="select * from results limit 0,50";
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
