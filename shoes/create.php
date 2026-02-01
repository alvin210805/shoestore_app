<?php
require_once("../config.php");
require_once("../helpers.php");

$in = body();
require_fields($in, ["name","brand","price"]);

$name = trim($in["name"]);
$brand = trim($in["brand"]);
$price = (int)$in["price"];
$desc = $in["description"] ?? "";
$image = $in["image_url"] ?? null;
$user_id = isset($in["user_id"]) ? (int)$in["user_id"] : null;

$stmt = $pdo->prepare("INSERT INTO shoes(user_id,name,brand,price,description,image_url) VALUES(?,?,?,?,?,?)");
$stmt->execute([$user_id,$name,$brand,$price,$desc,$image]);

ok(["id"=>$pdo->lastInsertId()], "Create shoe success");
