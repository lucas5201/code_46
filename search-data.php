<?php
header("Content-Type: text/html; charset=UTF-8");
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (!isset($_GET["circuit"]) || empty($_GET["circuit"])) {
    die("<div>Erreur : Aucun circuit fourni.</div>");
}


require("ressources/class/ConnexionPDO.php");

$data = ConnexionPDO::connect()->prepare("SELECT circuits.nom_circuit_fr as circuit, coupes.nom_coupe as coupe, jeux.nom_jeu as jeux
                                          FROM apparitions_circuit INNER JOIN coupes ON (coupes.id_coupe = apparitions_circuit.coupe)
                                                                   INNER JOIN circuits ON (circuits.id_circuit = apparitions_circuit.circuit)
                                                                   INNER JOIN jeux ON (jeux.id_jeu = apparitions_circuit.jeux)
                                          WHERE circuits.nom_circuit_fr LIKE :circuit");
$data->bindValue(":circuit", '%'.$_GET["circuit"].'%',PDO::PARAM_STR);  
$data->execute();
$res = $data->fetchAll();

if (count($res) === 0)
{
    $msg = "<div>Aucun résultat !</div>";
}
else 
{
    $msg = "";
    foreach($res as $circuit)
    {
        $msg .= <<<HTML
    <div>
        <h2>{$circuit['circuit']}</h2>
        <div>{$circuit['coupe']} - {$circuit['jeux']}</div>;
    </div>; 
HTML;
    }
}

echo $msg;