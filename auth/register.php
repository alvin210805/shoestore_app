<?php
require_once("../config.php");
require_once("../helpers.php");

$in = body();
require_fields($in, ["name", "email", "password"]);

$name = trim($in["name"]);
$email = trim($in["email"]);
$pass = $in["password"];

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) fail("Invalid email");

$stmt = $pdo->prepare("SELECT id FROM users WHERE email=?");
$stmt->execute([$email]);
if ($stmt->fetch()) fail("Email already registered");

$hash = password_hash($pass, PASSWORD_BCRYPT);

$stmt = $pdo->prepare("INSERT INTO users(name,email,password_hash) VALUES(?,?,?)");
$stmt->execute([$name, $email, $hash]);

ok(["user_id" => $pdo->lastInsertId()], "Register success");
