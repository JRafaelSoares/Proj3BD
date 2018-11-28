<html>

    <head>
        <link rel="stylesheet" href="styles.css">
    </head>

    <body>
        <?php
            include "functions.php";
            $type = $_REQUEST['type'];
            $column_names = $tables[$type];
            if(in_array($type, $EditPermissions))
                array_push($column_names, "Remove", "Edit");
            else
                array_push($column_names, "Remove");

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
                        <input type = 'hidden' name = 'pk' value = \"%s\">
                        <input type = 'hidden' name = 'type' value = '" . $type . "'>
                    </form>
                </div>";
                $edit = "
                <div class = 'Button EditButton'>
                    <form action = 'edit.php'>
                        <input class = 'MenuButton' type = 'submit' value = 'Edit'>
                        <input type = 'hidden' name = 'pk' value = \"%s\">
                        <input type = 'hidden' name = 'type' value = '" . $type . "'>
                        <input type = 'hidden' name = 'url' value = 'http://%s%s'>
                    </form>
                </div>";
                $add = "
                <div class = 'Button AddButton'>
                    <form action = 'insert.php'>
                        <input class = 'MenuButton' type = 'submit' value = 'Insert new row'>
                        <input type = 'hidden' name = 'type' value = '" . $type . "'>
                        <input type = 'hidden' name = 'url' value = 'http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]'>
                    </form> 
                </div>";
                
                foreach($result as $key => $row){
                    $values = "['";
                    for($i = 0; $i < count($primaryKeys[$type]); $i++){
                        if($i == count($primaryKeys[$type]) - 1){
                            $values .= $row[$primaryKeys[$type][$i]] . "'";
                            break;
                        }
                        $values .= $row[$primaryKeys[$type][$i]] . "', '";
                    }
                    $values .= "]";
                    $removeWithValues = sprintf($remove, $values);
                    $editWithValues = sprintf($edit, $values, $_SERVER[HTTP_HOST], $_SERVER[REQUEST_URI]);
                    array_push($result[$key], $removeWithValues);
                    array_push($result[$key], $editWithValues);
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
