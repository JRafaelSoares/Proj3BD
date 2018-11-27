<html>
    <body>
<?php
    $type = $_REQUEST['type'];
    $pk = $_REQUEST['pk'];

    include "functions.php";

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist187666";
        $password = "joana0101";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        /*
        foreach($tables[$type] as $column){
            echo(var_dump($_POST[$column]));
            
        }*/
        if(isset($_POST['submit'])){
            $sql = "INSERT INTO " . $type . " VALUES(";

            for($i = 0; $i < count($tables[$type]); $i++){
                if($tables[$type][$i] == 'Numero de Telefone' || $tables[$type][$i] == 'Numero do Processo de Socorro' || $tables[$type][$i] == 'Numero do Meio'){
                    if($i == count($tables[$type]) - 1){
                        $sql .= $_POST[str_replace(' ', '', $tables[$type][$i])] .");";
                        break;
                    }
                    $sql .= $_POST[str_replace(' ', '', $tables[$type][$i])] . ", ";
                }
            
                else{
                    if($i == count($tables[$type]) - 1){
                        $sql .= "'" . $_POST[str_replace(' ', '', $tables[$type][$i])] .");" . "'";
                        break;
                    }
                    $sql .= "'" . $_POST[str_replace(' ', '', $tables[$type][$i])] . "', ";
                }
            }
            echo($sql);
            $result = $db->prepare($sql);
            $result->execute();
        }

        $content = [];
        $elements = [];
        echo("<form method ='post' action=''>");
        foreach($tables[$type] as $column){
            array_push($elements,'
                            <p><input type="text" name="' . str_replace(' ', '', $column) . '"/></p>
                        ');
        }
        array_push($content, $elements);
        printTable($tables[$type], $content);
        echo('
                <p><input type="submit" name ="submit" value="Insert"/></p>
            </form>');
        
        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>
