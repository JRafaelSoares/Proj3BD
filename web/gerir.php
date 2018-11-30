<html>

    <head>
        <link rel="stylesheet" href="styles.css">
    </head>

    <body>
        <?php

            include "functions.php";

            $type = $_REQUEST['type'];
            $column_names = $tables[$type];

            $numColumns = count($column_names);

            if(in_array($type, $EditPermissions))
                array_push($column_names, "Remove", "Edit");
            else
                array_push($column_names, "Remove");

            try
            {
                $host = "db.ist.utl.pt";
                $dbname = $user;
                
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
                $sql = "SELECT ";

                if($type == "MeioCombate" || $type == "MeioSocorro" || $type == "MeioApoio"){

                    $sql .= implode(",", $primaryKeys["Meio"]);
                    $sql .= " FROM " . $type . " NATURAL JOIN Meio";

                    $column_names = $tables["Meio"];

                    $numColumns = count($column_names);

                    if(in_array($type, $EditPermissions))
                        array_push($column_names, "Remove", "Edit");
                    else
                        array_push($column_names, "Remove");

                }
                else{
                    $sql .= implode(",", $primaryKeys[$type]);
                    $sql .= " FROM " . $type;
                }

                $sql .= ";";


                $result = $db->prepare($sql);
                $result->execute();

                $result = $result->fetchAll();

                $remove = "
                <div class = 'MenuButton RemoveButton'>
                    <form class = 'form' action = 'remove.php'>
                        <input class = 'GerirButton' class = 'MenuButton' type = 'submit' value = 'Remove'>
                        <input type = 'hidden' name = 'pk' value = \"%s\">
                        <input type = 'hidden' name = 'type' value = '" . $type . "'>
                        <input type = 'hidden' name = 'url' value = 'http://%s%s'>
                    </form>
                </div>";

                $edit = "
                <div class = 'MenuButton EditButton'>
                    <form class = 'form' action = 'edit.php'>
                        <input class = 'GerirButton' class = 'MenuButton' type = 'submit' value = 'Edit'>
                        <input type = 'hidden' name = 'pk' value = \"%s\">
                        <input type = 'hidden' name = 'type' value = '" . $type . "'>
                        <input type = 'hidden' name = 'url' value = 'http://%s%s'>
                    </form>
                </div>";

                $add = "
                <div class = 'MenuButton AddButton'>
                    <form class = 'form' action = 'insert.php'>
                        <input class = 'GerirButton' class = 'MenuButton' type = 'submit' value = 'Insert New Row'>
                        <input type = 'hidden' name = 'type' value = '" . $type . "'>
                        <input type = 'hidden' name = 'url' value = 'http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]'>
                    </form> 
                </div>";
                
                foreach($result as $key => $row){

                    $values = "";

                    for($i = 0; $i < $numColumns; $i++){

                        if($i == $numColumns - 1){
                            $values .= $row[$i];
                            break;
                        }

                        $values .= $row[$i] . ",";
                    }

                    $removeWithValues = sprintf($remove, $values, $_SERVER[HTTP_HOST], $_SERVER[REQUEST_URI]);
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
                echo("<p>Erro ao obter a tabela</p>");
            }
            
        ?>

        <form method = 'post' action = 'index.html'>
            <input type='submit' class = 'homeButton' value = "Home">
        </form>

    </body>
</html>
