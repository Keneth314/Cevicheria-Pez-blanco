<?php

class conexionSingleton{
	
	private $_connection;
	private static $intancia;

	// Solo cambiamos los datos de la BD
	private $_host = "localhost";
	private $_username = "root";
	private $_password = "";
	private $_database = "pruebaads";


	// Singleton: Retorna la instancia
	public static function getInstance() {
		if(self::$intancia == null) { // Si no hay una instancia creamos una
			self::$intancia = new self(); // Se crea una instancia de la clase y se ejecuta el constructor
		}
		return self::$intancia;
	}

	// Constructor: crea la conexión con la BD cuando se crea una intancia de la clase
	private function __construct() {
		$this->_connection = new mysqli($this->_host, $this->_username, $this->_password, $this->_database);
	
	}

	// Obtengo la conexión 
	public function getConnection() {
		return $this->_connection;
	}
}
?>