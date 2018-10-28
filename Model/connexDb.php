<?php

    require'variables-environnement.php';


            try
            {
                $db = new PDO("mysql:host=localhost;dbname=$db;charset=utf8","$user","$password");

            }
            catch(Exception $e)
            {
            die("Base de données non trouvée ");
            }
