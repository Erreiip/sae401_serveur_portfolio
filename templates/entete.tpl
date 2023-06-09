<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title class="nom-portfolio"> {{ nomPortfolio }} - DeepFolio</title>
    <!-- OUR icon -->
    <link rel="icon" href="../img/favicon_io/android-chrome-512x512.png" type="image/x-icon" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="../css/mdb.min.css" />
    <link rel="stylesheet" href="../css/visualisation.css" />

    {% if debug == "true" %}
        <style>
            .print {
                display: block !important;
            }

            body > *:not(#contentToPrint) {
                display:none;
            }

            #btnAjouterComp, #btnAjouterProjet {
                display:none;
            }

            #pageAccueil {
                margin-top:30%;
            }
            
            .pagebreak {
                page-break-after: always;
            }

            .pagebreakb {
                page-break-before: always;
            }
        </style>
    {% endif %}

    {% if colorBck != "" %}
        <style>
            body {
                background-color : {{colorBck}};
            }
        </style>
    {% endif %}

</head>

<body>
    <!------------------->
    <!--NavBar ---------->
    <!------------------->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <!-- Container wrapper -->

        <div class="container-fluid">
            <!-- Toggle button -->
            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                data-mdb-target="#navbarLeftAlignExample" aria-controls="navbarLeftAlignExample" aria-expanded="false"
                aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Collapsible wrapper -->
            <div class="collapse navbar-collapse" id="navbarLeftAlignExample">
                <!-- Left links -->
                <img id="logo-nav" src="..\img\favicon_io\logo-79x76.png" alt="">
                <div style="margin-left: 20px;">
                    <h1 class="editableText nom-portfolio">{{ nomPortfolio }}</h1>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a id="linkAccueil"class="nav-link active" aria-current="page" href="#">Accueil</a>
                        </li>
                        <li class="nav-item">
                            <a id="linkCompetences"class="nav-link active" href="#">Compétences</a>
                        </li>

                        <li class="nav-item">
                            <a id="linkProjets"href="#" class="nav-link active">Projets</a>
                        </li>

                        <li class="nav-item">
                            <a id="linkCV"href="#" class="nav-link active">CV</a>
                        </li>

                        <li class="nav-item">
                            <a id="linkContact"href="#" class="nav-link active">Contact</a>
                        </li>
                    </ul>
                </div>
                <div class="col d-flex justify-content-end gap-3">
                    {% if estProprio == true %}
                        <div id="cbAccess" class="form-check form-switch d-flex align-items-center">
                            <input class="form-check-input me-3 accessibilité" id="cbAccessible" type="checkbox" role="switch"
                                id="flexSwitchCheckDefault" />
                            <label class="form-check-label" for="flexSwitchCheckDefault">Visible</label>
                        </div>

                        
                    {% endif %}
                    <a href="accueil.php" id="btnHome">
                        <img src="..\img\favicon_io\home.png" alt="accueil">
                    </a>
                   
                   
                    {% if estProprio == true %}
                        <a href="#" id="btnSauver">
                            <img src="..\img\favicon_io\floppy-disk.png" alt="sauver">
                        </a>
                        <a href="#" id="btnToggleEdit">
                            <img src="..\img\favicon_io\editer.png" alt="editer">
                        </a>
                    {% endif %}

                </div>


            </div>
            <!-- Collapsible wrapper -->
        </div>
        <!-- Container wrapper -->
    </nav>