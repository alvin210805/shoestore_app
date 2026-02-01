<?php
require_once("../config.php");
require_once("../helpers.php");

$in = body();
require_fields($in, ["email", "password"]);

$email = trim($in["email"]);
$pass = $in["password"];

$stmt = $pdo->prepare("SELECT id,name,email,password_hash FROM users WHERE email=?");
$stmt->execute([$email]);
$user = $stmt->fetch();

if (!$user) fail("Email not found", 401);
if (!password_verify($pass, $user["password_hash"])) fail("Wrong password", 401);

// simple session token (basic)
$token = base64_encode($user["id"] . "|" . $user["email"] . "|" . time());

ok([
  "token" => $token,
  "user" => ["id"=>$user["id"], "name"=>$user["name"], "email"=>$user["email"]]
], "Login success");
