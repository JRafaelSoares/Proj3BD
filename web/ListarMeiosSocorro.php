<html>
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <?php
            
            include "functions.php";
            $ListOfAssociation = ["EventoEmergencia", "Acciona", "Meio"];
            try{
                $host = "db.ist.utl.pt";
                $user ="ist187666";
                $password = "joana0101";
                $dbname = $user;
                
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "SELECT numMeio, nomeMeio, nomeEntidade FROM ";
                
                $SelectionTable = "Local";
                $QueryTable = "Meio";

                $columnNum1 = count($tables[$SelectionTable]);
                $columnNum2 = count($tables[$QueryTable]);

                $issetSelection = isset($_POST[$SelectionTable . 'Select']);
                $SelectionByTypingInput = $_POST['selectedProcess'];

                //Check if there has been an input
                if($issetSelection || $SelectionByTypingInput != ""){
                    //Verificacao de que o input nao e contraditorio
                    $moradaLocalSelected = $_POST[$SelectionTable . 'Select'];
                    if($issetSelection && $SelectionByTypingInput != "")
                        if($moradaLocalSelected == $SelectionByTypingInput)
                            $moradaLocal = $moradaLocalSelected;
                        else{
                            echo('Seleccionado um processo diferente do escrito');
                            return;
                        }
                    else
                        $moradaLocal = $issetSelection ? $moradaLocalSelected : $SelectionByTypingInput;

                    //Preparacao do query
                    for($i = 0; $i < count($ListOfAssociation); $i++){
                        if($i == count($ListOfAssociation) - 1){
                            $sql = $sql . $ListOfAssociation[$i];
                            break;
                        }
                        $sql = $sql . $ListOfAssociation[$i] . " NATURAL JOIN ";
                    }
                    $sql = $sql . " WHERE moradalocal = " . toCorrectType('moradalocal', $moradaLocal) . ";";

                    $result2 = $db->prepare($sql);
                    $result2->execute();
                    $result2 = $result2->fetchAll();

                    //Print da tabela
                    echo("<div class = 'ColumnRight'>");
                    printTable($tables[$QueryTable], $result2, $QueryTable);
                    echo("</div></form>");
                }
                //Preparacao da tabela a mostrar para o utilizador seleccionar uma linha
                $sql = "SELECT * FROM " . $SelectionTable . ";";

                $result = $db->prepare($sql);

                $result->execute();
                $result = $result->fetchAll();
                
                $resultCount = count($result);

                $selection = "
                    <input type = 'radio' name = '" . $SelectionTable . "Select' class = 'radioSelect' value = '%s'>
                ";

                $selectByTyping = "
                            <input type = 'text' name = 'selectedProcess'>";

                echo("<form method = 'post'>
                        <input class = 'confirmButtonAssocia' type='submit' value='Confirmar'>
                ");

                echo("<div class = 'ColumnLeft'>");

                foreach($result as $key => $row){

                    $value = "";

                    for($i = 0; $i < $columnNum1; $i++){
                        $value .= $row[$i] . ",";
                    }

                    array_push($result[$key], sprintf($selection, substr($value, 0, -1)));
                }
                array_push($tables[$SelectionTable], "");

                array_unshift($result, [$selectByTyping]);

                printTable($tables[$SelectionTable], $result, $SelectionTable, "selectionCell");

                echo("</div>");
                
                $db = null;
            }
            catch (PDOException $e)
            {
                echo("<p>ERROR: {$e->getMessage()}</p>");
            }
        ?>

        <form method = 'post' action = 'index.html'>
            <input type='submit' class = 'homeButton' value = "Home">
        </form>

    </body>
</html>
