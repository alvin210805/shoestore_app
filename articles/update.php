<?php
require_once("../config.php");
require_once("../helpers.php");

$in = body();
require_fields($in, ["id","title","content"]);

$id = (int)$in["id"];
$title = trim($in["title"]);
$content = trim($in["content"]);
$image = $in["image_url"] ?? null;

$stmt = $pdo->prepare("UPDATE articles SET title=?,content=?,image_url=? WHERE id=?");
$stmt->execute([$title,$content,$image,$id]);

ok([], "Update article success");
