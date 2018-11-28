<html>
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
<?php
    $type = $_REQUEST['type'];

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
            $sql = "INSERT INTO " . $type . " VALUES(";

            for($i = 0; $i < count($tables[$type]); $i++){
                if($i == count($tables[$type]) - 1){
                    $sql .= toCorrectType($tables[$type][$i], $_POST[str_replace(' ', '', $tables[$type][$i])]) .");";
                    break;
                }
                $sql .= toCorrectType($tables[$type][$i], $_POST[str_replace(' ', '', $tables[$type][$i])]) . ", ";
            }
            echo($sql);
            $result = $db->prepare($sql);
            $result->execute();
            $newURL = $_REQUEST['url'];
            header('Location: ' . $newURL);
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
