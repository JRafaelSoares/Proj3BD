<html>
    
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>

    <body>
        <?php
            include "functions.php";

            try
            {
                $column_names_processo = ['Numero do Processo de Socorro'];
                $column_names_meio = ['Numero do Meio', 'Nome do Meio', 'Nome da Entidade'];

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


                echo("<div class = 'ColumnLeft'>");
                printTable($column_names_processo, $result1, "ProcessoSocorro");
                echo("</div>");

                echo("<div class = 'ColumnRight'>");
                printTable($column_names_meio, $result2, "Meio");
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