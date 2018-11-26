<html>
    <body>
<?php
    //$type = $_REQUEST['type']
    
    $type = $_REQUEST['type'];
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist187696";
        $password = "bvsl7219";
        $dbname = $user;
        
        
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
        $sql = "SELECT * FROM Local;"; // :type
        $result = $db->prepare($sql);
        $result->execute(); //[':type' => $type]

        echo("<table border=\"1\">\n");

        echo("<tr>");
        $i = 0;
        while($i < pg_num_fields($result))
        {
            $field_name = pg_field_name($result, $i);
            echo('<td>' . $field_name . '</td>');
            $i = $i + 1;
        }
        echo("</tr>");
        $i = 0;

        while ($row = pg_fetch_row($result)){
            echo('<tr>');
            $count = count($row);
            $y = 0;

            while($y < $count){
                $c_row = current($row);
                echo('<td>' . $c_row . '</td>');
                next($row);
                $y = $y + 1; 
            }
            echo('</tr>');
            $i = $i + 1;
        }
        echo("</table>\n");

    
        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>
