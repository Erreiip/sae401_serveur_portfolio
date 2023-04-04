<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);


require '../server/DB.inc.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}  

if( !isset($_SESSION["loggedin"])) {
    header("Location: connexion.php");
    exit();    
}

if (isset($_POST['nomPortfolio'])) {


    $portfolio_cookie =  html_entity_decode($_COOKIE['portfolio']);
    $portfolio_json = json_decode($portfolio_cookie);

    $username = $_SESSION['user']->getNomUtilisateur();
    $nomPortfolio = $_POST['nomPortfolio'];
    $accesible  = isset($_POST['accesible']);

    $db = DB::getInstance();

    $result = $db->addPortfolio($username, $nomPortfolio, var_export($accesible, true));

    if($result) {
        creerPages($portfolio_json, $db);
    }
    else {
        echo "Erreur lors de la création du portfolio";
    }

}



function creerPages($portfolioJSON, $db){

    $jsonCV = null;
    $competences = $portfolioJSON->competences;
    $projets = $portfolioJSON->projets;
    $parcours = $portfolioJSON->parcours;

    $jsonCompetences    = creerJsonCompetences($competences);
    $jsonProjets        = creerJsonProjets($projets);
    $jsonParcours       = creerJsonParcours($parcours);
    $jsonCV             = creerJsonPageCV($portfolioJSON);

    $username       = $_SESSION['user']->getNomUtilisateur();
    $numPortfolio   = $db->getNewestPortfolioId($username);

    $db->addPage($username, $numPortfolio, $jsonCompetences);
    $db->addPage($username, $numPortfolio, $jsonProjets);
    $db->addPage($username, $numPortfolio, $jsonParcours);
    $db->addPage($username, $numPortfolio, $jsonCV);

    $url['auteur'] = $username;
    $url['idPortfolio'] = $numPortfolio;

    header("Location: visualisation.php?cle=\"" . base64_encode(json_encode($url)) . "\""); 
}

function creerJsonCompetences($competences) {

    $competencesString = '{"page": "competences", "competences": ';

    $competencesString .= json_encode($competences);

    $competencesString .= "}";

    return $competencesString;
}

function creerJsonProjets($projets){
    
    $projetsString = '{"page": "projets", "projets": ';

    $projetsString .= json_encode($projets);

    $projetsString .= "}";

    return $projetsString;
}

function creerJsonParcours($parcours){
        
    $parcoursString = '{"page": "parcours", "parcours": ';
    
    $parcoursString .= json_encode($parcours);

    $parcoursString .= "}";

    return $parcoursString;
}

function creerJsonPageCV($portfolio_json){

    $stringCV = json_encode($portfolio_json);

    $stringCV = '{"page": "cv",' . substr($stringCV, 1, strlen($stringCV) -1 );

    return $stringCV;

}

?>