<?php
require_once("../config.php");
require_once("../helpers.php");

$id = $_GET["id"] ?? "";
if ($id === "") fail("id required");

$stmt = $pdo->prepare("SELECT * FROM articles WHERE id=?");
$stmt->execute([$id]);
$data = $stmt->fetch();
if (!$data) fail("Not found", 404);

ok($data, "Article detail");
