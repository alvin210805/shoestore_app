<?php
require_once("../config.php");
require_once("../helpers.php");

$in = body();
require_fields($in, ["id"]);

$id = (int)$in["id"];
$stmt = $pdo->prepare("DELETE FROM articles WHERE id=?");
$stmt->execute([$id]);

ok([], "Delete article success");
