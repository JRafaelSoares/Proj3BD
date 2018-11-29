<html>
    <body>
<?php
    $type = $_REQUEST['type'];
    $pk = eval("return " . $_REQUEST['pk'] . ";");
    include "functions.php";

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist187666";
        $password = "joana0101";

        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "DELETE FROM " . $type . " WHERE ";

	
        $i = 0;
        foreach ($primaryKeys[$type] as $key) {
            if($i != 0) {
                $sql = $sql . " AND ";
            }
            $sql .= $key . toCompare($key) . toCorrectType($key, $pk[$i]);
    		
    	    $i = $i + 1;
        }
	
        $sql = $sql . ";";

        echo("<p>$sql</p>");

        $result = $db->prepare($sql);
        $result->execute();

        $db = null;

        $newURL = $_REQUEST['url'];
        header('Location: ' . $newURL);
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>
