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
                $user ="ist187666";
                $password = "joana0101";
                $dbname = $user;
                
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
                $sql1 = "SELECT * FROM ProcessoSocorro;";
                $sql2 = "SELECT * FROM Meio;";


                $result1 = $db->prepare($sql1);
                $result2 = $db->prepare($sql2);

                $result1->execute();
                $result2->execute();

                $result1 = $result1->fetchAll();
                $result2 = $result2->fetchAll();

                $result1Count = count($result1);
                $result2Count = count($result2);


                $selectionProcesso = "
                    <input type = 'radio' name = 'ProcessoSelect' class = 'radioSelect' value = '%s'>
                "

                $selectionMeio = "
                    <input type = 'radio' name = 'MeioSelect' class = 'radioSelect' value = '%s'>
                "


                echo("<div class = 'ColumnLeft'>");

                foreach($result1 as $row){
                    for($i = 0; $i < $result1Count; $i++){
                        array_push($result1[$row[$i]], sprintf($selectionProcesso, $row[$i]));
                    }
                }

                array_push($tables['ProcessoSocorro'], [""]);

                printTable($tables['ProcessoSocorro'], $result1, "ProcessoSocorro", "selectionCell");

                echo("</div>");

                echo("<div class = 'ColumnRight'>");

                array_push($tables['Meio'], [""]);

                printTable($tables['Meio'], $result2, "Meio", "selectionCell");
                echo("</div>");

                $db = null;
            }
            catch (PDOException $e)
            {
                echo("<p>ERROR: {$e->getMessage()}</p>");
            }
        ?>
    </body>
</html>