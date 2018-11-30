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

                $dbname = $user;
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                //Quando faz submit
                if(isset($_POST['submit'])){

                    $sql = "INSERT INTO " . $type . " VALUES(";

                    $columns = count($primaryKeys[$type]);

                    for($i = 0; $i < $columns; $i++){
                        if($i == $columns - 1){
                            $sql .= toCorrectType($primaryKeys[$type][$i], $_POST[$primaryKeys[$type][$i]]) .");";
                            break;
                        }

                        $sql .= toCorrectType($primaryKeys[$type][$i], $_POST[$primaryKeys[$type][$i]]) . ", ";
                    }

                    echo($sql);

                    $result = $db->prepare($sql);
                    $result->execute();

                    $newURL = $_REQUEST['url'];
                    header('Location: ' . $newURL);
                }

                $content = [];
                $elements = [];

                echo("<form method = 'post'>");

                $columns = count($primaryKeys[$type]);

                for($i = 0; $i < $columns; $i++){

                    array_push($elements, '
                        <input type = "text" name = "' . $primaryKeys[$type][$i] . '"/>
                    ');
                }

                array_push($content, $elements);

                printTable($tables[$type], $content);

                echo('
                        <input type = "submit" class = "SimpleButton" name = "submit" value = "Insert"/>
                    </form>');
                
                $db = null;
            }
            catch (PDOException $e)
            {
                echo("<p>Erro ao inserir valores na tabela</p>");
            }
        ?>

        <form method = 'post' action = 'index.html'>
            <input type='submit' class = 'homeButton' value = "Home">
        </form>

    </body>
</html>
