<?php


require "Model/modelAfficherArticle.php";
// ouverture d'une connexion avec un server distant 

$curl = curl_init();  

// on créé un objet curl et on lance l'initialisation de l'objet qui permet d'ouvrir les url à distance.

curl_setopt($curl,CURLOPT_URL,"https://www.lemonde.fr/rss/une.xml"); 

// on configure l'objet pour lui dire quel url il doit atteindre.

curl_setopt($curl,CURLOPT_RETURNTRANSFER,true); 

// pour ne pas récuperer le contenu sous sa forme brute on modère ce qu'il récupère, on préfère donc mettre CURLOPT_RETURNTRANSFER pour récuperer le contenu sous forme de chaine et non de bloc.
            
$contenu = curl_exec($curl); 

// ici on execute l'objet $curl qu'on a initialisé plus tôt, ce qui nous permet de récuperer le contenu. Cependant en fonction de l'architecture du flux RSS et donc de la façon dont le code XML est fait on doit l'afficher d'une certaine manière.

$xml = new simpleXMLElement($contenu); 

// on doit donc parser le fichier XML, on créé donc un nouvel objet qu'on stock dans la variable $xml

/* la commande : echo "<pre>".print_r($xml,1)."</pre>"; nous permet de consulter l'architecture du flux */

if(isset($_POST['entrer']))
{
    foreach($xml->channel->item as $article) 
    {
        insertArticle($article);
    }
}

if(isset($_POST['afficher']))  
{
    foreach($xml->channel->item as $article) 
    {
        $titre= $article->title;
        $desc = $article->description;
        echo $titre."<br>".$desc."<br><br>" ;
    }
    
}

require "View/viewAfficherArticle.php";