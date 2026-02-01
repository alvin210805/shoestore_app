<?php
require_once("../config.php");
require_once("../helpers.php");

$stmt = $pdo->query("SELECT id,name,brand,price,description,image_url,created_at FROM shoes ORDER BY id DESC");
ok($stmt->fetchAll(), "Shoes list");
