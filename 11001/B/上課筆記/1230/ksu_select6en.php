<?php
 $dept=str_replace("'","''",$_REQUEST['dept']); 
 
 $db_host = "localhost";
 $db_name = "ksu_database";
 $db_table = "ksu_std_table";
 $db_user = "root";
 $db_password = "";
 // check connection
 $conn = mysqli_connect($db_host, $db_user, $db_password);
 if(empty($conn)){
	print  mysqli_error ($conn);
        die ("Unable to connect to DB！" );
	exit;
 }  
 if(!mysqli_select_db( $conn, $db_name)){
	die("DB is not existed");
	exit;
 }  
 //main scope  
 mysqli_set_charset($conn,'utf8');

 echo "ksu_std_table: the number of students as follows:". "<br/><br/>";  
$result = mysqli_query
($conn,
"SELECT ksu_std_name,ksu_std_grade
 FROM ksu_std_table
 where ksu_std_department = '$dept'
 order by ksu_std_grade");  
 echo "<table border='1'>                   
 <tr>
   <th> name </th>  <th> grade </th>  <th> memo </th>
 </tr>";                      
$row_num=0;
$CS_num=0;
//use mysqli_fetch_array() takes the data from DB
 while ($row = mysqli_fetch_array($result)) 
 {
   echo "<tr>";
   echo "<td>" . $row["ksu_std_name"] . "</td>";
   echo "<td>" . $row["ksu_std_grade"] . "</td>";
   if ($row['ksu_std_grade'] < 60 )
   {	echo "<td style=\"background-color:Yellow\"> " . "make up" .  "</td>";
   }
   else
   {	echo"<td>" . "" .    "</td>";
   }
   echo "</tr>";

     $row_num = $row_num+1;
     if ($row ["ksu_std_grade"]=="CS")
 {       $tmp_department=$row ["ksu_std_department"];
         $CS_num = $CS_num+1;
 }         
 }
 echo "</table>";
 echo  $row_num."records found"."<br/><br/>";
?> 
<form enctype="multipart/form-data" method="post" action="ksu_select6en.html" > 
<input type="submit" name="sub" value="返回"/>
</form>