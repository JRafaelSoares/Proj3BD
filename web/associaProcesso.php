<html>
    
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>

    <body>
        <?php

            include "functions.php";

            try
            {

                $host = "db.ist.utl.pt";
                $dbname = $user;
                
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


                $type1 = "ProcessoSocorro";
                $type2 = "Meio";


                $columnNum1 = count($tables[$type1]);
                $columnNum2 = count($tables[$type2]);

                $type = "Acciona";
                $typeColumns = "(numMeio, nomeEntidade, numProcessoSocorro)";

                if(isset($_POST[$type1 . 'Select']) && isset($_POST[$type2 . 'Select'])){
                    $sql = "INSERT INTO " . $type . $typeColumns . " VALUES(";

                    $valuesType1 = explode(",", $_POST[$type1 . 'Select']);
                    $valuesType2 = explode(",", $_POST[$type2 . 'Select']);

                    $columnNumType = count($tables[$type]);

                    foreach($tables[$type] as $column){

                        if(($key = array_search($column, $tables[$type1])) !== FALSE){
                            $sql .= toCorrectType($column, $valuesType1[$key]) . ",";
                        }
                        elseif(($key = array_search($column, $tables[$type2])) !== FALSE){
                            $sql .= toCorrectType($column, $valuesType2[$key]) . ",";
                        }

                    }

                    $sql = substr($sql, 0, -1);
                    $sql .= ");";

                    $result = $db->prepare($sql);

                    $result->execute();
                }
                
                $sql1 = "SELECT * FROM " . $type1 . ";";
                $sql2 = "SELECT * FROM " . $type2 . ";";


                $result1 = $db->prepare($sql1);
                $result2 = $db->prepare($sql2);

                $result1->execute();
                $result2->execute();

                $result1 = $result1->fetchAll();
                $result2 = $result2->fetchAll();

                $result1Count = count($result1);
                $result2Count = count($result2);


                $selectionType1 = "
                    <input type = 'radio' name = '" . $type1 . "Select' class = 'radioSelect' value = '%s'>
                ";

                $selectionType2 = "
                    <input type = 'radio' name = '" . $type2 . "Select' class = 'radioSelect' value = '%s'>
                ";

                echo("<form method = 'post'>
                        <input class = 'confirmButtonAssocia' type='submit' value='Confirmar'>
                ");

                echo("<div class = 'ColumnLeft'>");

                foreach($result1 as $key => $row){

                    $value = "";

                    for($i = 0; $i < $columnNum1; $i++){
                        $value .= $row[$i] . ",";
                    }

                    array_push($result1[$key], sprintf($selectionType1, substr($value, 0, -1)));
                }

                array_push($tables[$type1], "");

                printTable($tables[$type1], $result1, $type1, "selectionCell");

                echo("</div>");

                echo("<div class = 'ColumnRight'>");

                foreach($result2 as $key => $row){

                    $value = "";

                    for($i = 0; $i < $columnNum2; $i++){
                        $value .= $row[$i] . ",";
                    }

                    array_push($result2[$key], sprintf($selectionType2, substr($value, 0, -1)));
                }

                array_push($tables[$type2], "");

                printTable($tables[$type2], $result2, $type2, "selectionCell");
                echo("</div></form>");

                $db = null;
            }
            catch (PDOException $e)
            {
                echo("<p>Erro ao associar Processo de Socorro ao Meio</p>");
            }
        ?>

        <form method = 'post' action = 'index.html'>
            <input type='submit' class = 'homeButton' value = "Home">
        </form>

    </body>
</html>