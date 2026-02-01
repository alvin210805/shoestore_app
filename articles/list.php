<?php
require_once("../config.php");
require_once("../helpers.php");

$stmt = $pdo->query("SELECT id,title,content,image_url,created_at FROM articles ORDER BY id DESC");
ok($stmt->fetchAll(), "Articles list");
