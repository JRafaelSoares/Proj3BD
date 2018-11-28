<html>
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>
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

        //Quando faz submit
        if(isset($_POST['submit'])){
            $sql = "UPDATE " . $type . " SET ";
            $Where = " WHERE ";
            for($i = 0; $i < count($primaryKeys[$type]); $i++){
                $sql .= $primaryKeys[$type][$i] . " = " . toCorrectType($tables[$type][$i], $_POST[str_replace(' ', '', $tables[$type][$i])]);
                $Where .= $primaryKeys[$type][$i] . " = " . toCorrectType($primaryKeys[$type][$i], $pk[$i]);
                if($i < count($primaryKeys[$type]) - 1){
                    $sql .= ", ";
                    $Where .= " AND ";
                }
            }

            $sql .= $Where . ";";
            echo($sql);
            $result = $db->prepare($sql);
            $result->execute();
            $newURL = $_REQUEST['url'];
            header('Location: ' . $newURL);
        }

        $content = [];
        $elements = [];
        echo("<form method ='post' action=''>");
        for($i = 0; $i < count($tables[$type]); $i++){
            array_push($elements,'
                            <p><input type="text" name="' . str_replace(' ', '', $tables[$type][$i]) . '"/
                            value="' . str_replace(' ', '', $pk[$i]) . '"/></p>
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
