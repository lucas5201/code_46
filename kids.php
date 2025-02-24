<?php
$msg = "";
#Si tu n'as pas mis un paramètre (exemple, si tu nommes ta page kid.php, et que ton lien ne ressemble pas à kid.php?id=1, il va exécuter cette condition)
if (!is_set($_GET["id"]))
{
    $msg = "<div>ERREUR: Id non renseigné</div>";
}

else 
{
    $ma_req= ConnexionPDO::connect()->prepare("SELECT * FROM enfants
                                                WHERE id = :id");
    $ma_req->bindValue(":id", 4, PDO::PARAM_INT);
    $ma_req->execute();
    $res = $ma_req->fetch(PDO::FETCH_ASSOC);
    //La méthode fetch renvoie les résultats s'il trouve les données, ou bien une valeur false s'il en trouve pas.
    if (!$res)
    {
        $msg = "<div>Aucun résultat !</div>";
    }
}
//La condition $test = $res ?? "" indiique que si la valeur $res existe, $test aura la valeur $res, dans le cas contraire, $test aura la valeur ""
$kid = [
    "nom" => $res["Nom"] ?? "",
    "surnom" => $res["Surnom"] ?? "",
    "anniversaire" => $res["Anniversaire"] ?? "",
    "description" => $res["Description"] ?? "",
];

# <?= $test ?.> revient à faire <?php echo $test;
?>

<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mon personnage</title>
</head>
<body>
        <?=$msg;?>
        <h2><?=$kid['nom'];?> - <?=$kid['surnom'];?> </h2>

        <div>Né le: <?=$kid['anniversaire'};?></div>

        <div><?=$kid["description"];?></div>
</body>
</html>
 
