<html>

    <head>
        <link rel="stylesheet" href="styles.css">
    </head>

    <body>
        <?php
            include "functions.php";
            $type = $_REQUEST['type'];
            $column_names = eval("return " . $_REQUEST['columnNames'] . ";");
            array_push($column_names, "Remove", "Edit");
            try
            {
                $host = "db.ist.utl.pt";
                $user ="ist187666";
                $password = "joana0101";
                $dbname = $user;
                
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
                $sql = "SELECT * FROM " . $type . ";";

                $result = $db->prepare($sql);
                $result->execute();

                $result = $result->fetchAll();

                $remove = "
                <div class = 'Button RemoveButton'>
                    <form action = 'remove.php'>
                        <input class = 'MenuButton' type = 'submit' value = 'Remove'>
                        <input type = 'hidden' name = 'type' value = '%s'>
                    </form>
                </div>";
                $edit = "
                <div class = 'Button EditButton'>
                    <form action = 'edit.php'>
                        <input class = 'MenuButton' type = 'submit' value = 'Confirm'>
                        <input type = 'hidden' name = 'type' value = '%s'>
                    </form>
                </div>";
                $add = "
                <div class = 'Button AddButton'>
                    <form action = 'insert.php'>
                        <input class = 'MenuButton' type = 'submit' value = 'Insert new row'>
                        <input type = 'hidden' name = 'type' value = '%s'>
                    </form> 
                </div>";

                foreach($result as $key => $row){
                    $values = "['";
                    foreach($primaryKeys[$type] as $primaryKey){
                        $values .= $row[$primaryKey] . "',";
                    }
                    $values .= "]";
                    $removeWithValues = sprintf($remove, $values);
                    $editWithValues = sprintf($edit, $values);
                    $addWithValues = sprintf($add, $values);
                    array_push($result[$key], $removeWithValues);
                    array_push($result[$key], $editWithValues);
                    array_push($result[$key], $addWithValues);
                }

                array_unshift($result, [$add]);

                printTable($column_names, $result);

                $db = null;
            }
            catch (PDOException $e)
            {
                echo("<p>ERROR: {$e->getMessage()}</p>");
            }
        ?>
    </body>
</html>
