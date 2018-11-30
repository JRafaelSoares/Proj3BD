<html>
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <?php
            $type = "Meio";

            //$mainType = "Meio";

            $pk = explode(",", $_REQUEST['pk']);

            /*echo("<p>");
            echo(var_dump($pk));
            echo("</p>");*/

            //$pk = eval("return " . $_REQUEST['pk'] . ";");

            include "functions.php";

            try
            {
                $host = "db.ist.utl.pt";
                
                $dbname = $user;
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                //Quando faz submit
                if(isset($_POST['submit'])){
                    $sql = "UPDATE " . $type . " SET ";

                    $sql .= $primaryKeys[$type][0] . " = " . $pk[0] . ", ";
                    $sql .= $primaryKeys[$type][1] . " = '" . $_POST[$primaryKeys[$type][1]] . "', ";
                    $sql .= $primaryKeys[$type][2] . " = '" . $pk[2] . "' ";

                    $where = " WHERE ";

                    $columns = count($primaryKeys[$type]);

                    for($i = 0; $i < $columns; $i++){
                        $where .= $primaryKeys[$type][$i] . " = " . toCorrectType($primaryKeys[$type][$i], $pk[$i]);

                        if($i < $columns - 1){
                            $where .= " AND ";
                        }
                    }

                    $sql .= $where . ";";

                    //echo($sql);

                    $result = $db->prepare($sql);
                    $result->execute();

                    $newURL = $_REQUEST['url'];
                    header('Location: ' . $newURL);
                }

                $content = [];

                echo("<form method = 'post'>");

                array_push($content, ['
                    <input type = "text" name = "nomemeio" value = "' . $pk[1] . '"/>
                ']);

                printTable(["Nome do Meio"], $content);

                echo('
                        <input type="submit" name ="submit" class = "SimpleButton" value="Confirm Edit"/>
                    </form>');
                
                $db = null;
            }
            catch (PDOException $e)
            {
                echo("<p>Erro ao alterar a linha pedida</p>");
            }
        ?>

        <form method = 'post' action = 'index.html'>
            <input type='submit' class = 'homeButton' value = "Home">
        </form>

    </body>
</html>
