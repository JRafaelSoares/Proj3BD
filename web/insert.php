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

        foreach($tables[$type] as $column){
            if(isset($_REQUEST[$column]))
                echo("found one: " . $_REQUEST[$column]);
        }

        $content = [];
        $elements = [];
        echo("<form action=''>");
        foreach($tables[$type] as $column){
            array_push($elements,'
                            <p><input type="text" name="' . $column . '"/></p>
                        </form>');
        }
        array_push($content, $elements);
        printTable($tables[$type], $content);
        echo('
                <p><input type="submit" value="Insert"/></p>
            </form>');

        /*$sql = "INSERT INTO " . $type . " VALUES(";

        $result = $db->prepare($sql);
        $result->execute();*/
        
        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>
