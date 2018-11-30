<html>

    <head>
        <link rel="stylesheet" href="styles.css">
    </head>

    <body>
        <?php
            $type = $_REQUEST['type'];

            $pk = explode(",", $_REQUEST['pk']);

            include "functions.php";

            try
            {
                $host = "db.ist.utl.pt";

                $dbname = $user;
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                $sql = "DELETE FROM " . $type . " WHERE ";

        	
                $i = 0;
                foreach ($primaryKeys[$type] as $key) {
                    if($i != 0) {
                        $sql = $sql . " AND ";
                    }
                    $sql .= $key . toCompare($key, $pk[$i]) . toCorrectType($key, $pk[$i]);
            		
            	    $i = $i + 1;
                }
        	
                $sql = $sql . ";";

                $result = $db->prepare($sql);
                $result->execute();

                $db = null;

                $newURL = $_REQUEST['url'];
                header('Location: ' . $newURL);
            }
            catch (PDOException $e)
            {
                //echo("<p>Erro ao remover linha seleccionada</p>");
                if($type == 'Local' || $type == 'ProcessoSocorro'){
                    echo("<p> Erro de Referências. Remova os Eventos de Emergencia cujo " . $primaryKeys[$type][0] . " seja " . $pk[0] . " para apagar este " .$type . "</p>");
                }
            }
        ?>

        <form method = 'post' action = 'index.html'>
            <input type='submit' class = 'homeButton' value = "Home">
        </form>
    </body>
</html>
