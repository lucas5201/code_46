<?php
declare(strict_types=1);

class ConnexionPDO
{
    private static $dsn = 'mysql:host=localhost;dbname=mariokart';
    private static $utilisateur = "root";
    private static $motpasse = '';
    private static $admin = "";
    private static $admin_mdp = '';
    private static $connexion = null;
    private static $drivers = array( PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");
    
    public function __construct() {}


    /** Retourne si les paramètres de connexion à la base de données sont configurés. True si oui, False sinon
     * 
     *@return bool True si dsn configurés, False sinon
     */
    public static function isSet() 
    {
        if (self::$dsn != null)
        {
            return true;
        }
        else 
        {
            return false;
        }
    }

    /** Permet de se connecter à la base de données et retourne l'instance PDO, ou envoie une Exception si DSN non configurés */
    public static function connect(): PDO
    {
        if (self::isset())
        {
            self::$connexion = new PDO(self::$dsn, self::$utilisateur, self::$motpasse, self::$drivers);
            return self::$connexion;
        }
        else 
        {
            throw new Exception("La connexion à la base de données a échouée...");
            die();
        }
    }

        /** Permet de se connecter à la base de données et retourne l'instance PDO, ou envoie une Exception si DSN non configurés */
        public static function connectAdmin(): PDO
        {
            if (self::isset())
            {
                self::$connexion = new PDO(self::$dsn, self::$admin, self::$admin_mdp, self::$drivers);
                return self::$connexion;
            }
            else 
            {
                throw new Exception("La connexion à la base de données a échouée...");
                die();
            }
        }
}