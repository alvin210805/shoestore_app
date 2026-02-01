<?php
require_once("../config.php");
require_once("../helpers.php");

$in = body();
require_fields($in, ["title","content"]);

$title = trim($in["title"]);
$content = trim($in["content"]);
$image = $in["image_url"] ?? null;
$user_id = isset($in["user_id"]) ? (int)$in["user_id"] : null;

$stmt = $pdo->prepare("INSERT INTO articles(user_id,title,content,image_url) VALUES(?,?,?,?)");
$stmt->execute([$user_id,$title,$content,$image]);

ok(["id"=>$pdo->lastInsertId()], "Create article success");
