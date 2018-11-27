<html>
    <body>
        <?php
            
            $type = $_REQUEST['type'];
            $column_names = eval("return " . $_REQUEST['columnNames'] . ";");

            try
            {
                $host = "db.ist.utl.pt";
                $user ="ist187666";
                $password = "joana0101";
                $dbname = $user;
                
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
                $sql = "SELECT * FROM " . $type . ";"; // 

                $result = $db->prepare($sql);
                $result->execute();

                $array_size = count($column_names);

                echo("<table border=\"1\">\n");

                //Nomes das colunas
                echo("<tr>");
                foreach ($column_names as $column_name){
                    echo("<td>");
                    echo($column_name);
                    echo("</td>");
                }
                echo("</tr>");

                //Objetos
                foreach ($result as $row) {
                    echo("<tr>");

                    $i = 0;

                    while($i < $array_size){
                        echo("<td>");
                        echo($row[$i]);
                        echo("</td>");
                        $i = $i + 1;
                    }

                    echo("</tr>");
                }
                echo("</table>\n");
                $db = null;
            }
            catch (PDOException $e)
            {
                echo("<p>ERROR: {$e->getMessage()}</p>");
            }
        ?>
    </body>
</html>
