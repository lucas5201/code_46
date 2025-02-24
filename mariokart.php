<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="ressources/css/mariokart.css" rel="stylesheet" />
    <script>
        function afficherInfos(str) {            
            if (str === "") {
                document.getElementById("my-data").innerHTML = "<div>NO DATA</div>";
                return;
            }

            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4) {
                    if (this.status == 200) {
                        document.getElementById("my-data").innerHTML = this.responseText;
                    } else {
                        document.getElementById("my-data").innerHTML = "<div>Erreur lors de la requête</div>";
                    }
                }
            };

            xmlhttp.open("GET", "search-data.php?circuit=" + encodeURIComponent(str), true);
            xmlhttp.send();
        }

    </script>
</head>
<body>
    <h2>Formulaire Mario Kart</h2>
    <div>Nom du circuit</div>
        <form>
            <input type="text" id="circuit" name="circuit" oninput="afficherInfos(this.value)" placeholder="Entrez un circuit" />
        </form>
    
        <div id="my-data"></div>
</body>
</html>