<?php

  session_start();

  $host = "localhost";
  $dbname = "planningpoker";
  $user = "root";
  $pass = "";

  try {
      $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
      $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e) {
      echo "Error al conectar con la base de datos: " . $e->getMessage();
      die();
  }


  if ($_SERVER['REQUEST_METHOD'] === 'POST') {
      $user = $_POST['user'];  
      $sql = $pdo->prepare("INSERT INTO usuario (nombre) VALUES (:nombre)");
      $sql->bindValue(':nombre', $user); 
      try {
        $sql->execute();
        $_SESSION['user'] = $pdo->lastInsertId();
        header("Location: index.php");
        exit();
      } catch (PDOException $e) {
        echo "Error al insertar los datos: " . $e->getMessage();
      }

  }
  
?>