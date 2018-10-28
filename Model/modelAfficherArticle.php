<?php

function insertArticle($article)
{    
    $titre = $article->title;
    $desc = $article->description;
    
    global $db;

    $req = $db->prepare("INSERT INTO articles (titre, description) VALUES (:titre,:desc)");
    $req->bindParam (":titre", $titre, PDO::PARAM_STR);
    $req->bindParam (":desc", $desc, PDO::PARAM_STR);
    $req->execute();
    return $req->fetch();
}
