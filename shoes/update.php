<?php
require_once("../config.php");
require_once("../helpers.php");

$in = body();
require_fields($in, ["id","name","brand","price"]);

$id = (int)$in["id"];
$name = trim($in["name"]);
$brand = trim($in["brand"]);
$price = (int)$in["price"];
$desc = $in["description"] ?? "";
$image = $in["image_url"] ?? null;

$stmt = $pdo->prepare("UPDATE shoes SET name=?,brand=?,price=?,description=?,image_url=? WHERE id=?");
$stmt->execute([$name,$brand,$price,$desc,$image,$id]);

ok([], "Update shoe success");
