<?php
function body() {
  // support x-www-form-urlencoded OR JSON
  $raw = file_get_contents("php://input");
  $json = json_decode($raw, true);
  if (is_array($json)) return $json;
  return $_POST; // fallback
}

function ok($data = [], $message = "OK") {
  echo json_encode(["success" => true, "message" => $message, "data" => $data]);
  exit;
}

function fail($message = "Failed", $code = 400) {
  http_response_code($code);
  echo json_encode(["success" => false, "message" => $message]);
  exit;
}

function require_fields($arr, $fields) {
  foreach ($fields as $f) {
    if (!isset($arr[$f]) || trim($arr[$f]) === "") fail("Field '$f' is required");
  }
}
